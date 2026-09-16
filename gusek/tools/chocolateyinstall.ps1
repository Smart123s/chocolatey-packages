$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$installDir = Join-Path $toolsDir 'app'
$packageParameters = Get-PackageParameters

$packageArgs = @{
    packageName  = $env:ChocolateyPackageName
    destination  = $installDir
    fileFullPath = Join-Path $toolsDir 'gusek.zip'
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -LiteralPath (Join-Path $toolsDir 'gusek.zip') -Force -ErrorAction SilentlyContinue

# Keep the archive's layout and locate the application even if it is nested.
$executables = @(Get-ChildItem -LiteralPath $installDir -Filter '*.exe' -Recurse -File)
$gusekExecutables = @($executables | Where-Object { $_.Name -ieq 'gusek.exe' })
if ($gusekExecutables.Count -ne 1) {
    throw "Expected exactly one gusek.exe below '$installDir'; found $($gusekExecutables.Count)."
}

$targetPath = $gusekExecutables[0].FullName
$workingDirectory = $gusekExecutables[0].DirectoryName

# Let Chocolatey create only the GUSEK shim. In particular, do not shadow an
# independently installed GLPK command with the solver bundled inside GUSEK.
foreach ($executable in $executables) {
    if ($executable.FullName -ne $targetPath) {
        New-Item -Path ($executable.FullName + '.ignore') -ItemType File -Force | Out-Null
    }
}
New-Item -Path ($targetPath + '.gui') -ItemType File -Force | Out-Null

# Use Windows known folders so redirected desktops are handled correctly.
if (-not $packageParameters.NoStartMenuShortcut) {
    $programsPath = [Environment]::GetFolderPath('CommonPrograms')
    if ([string]::IsNullOrWhiteSpace($programsPath)) {
        Write-Warning 'The all-users Start Menu folder is unavailable; skipping its shortcut.'
    } else {
        Install-ChocolateyShortcut `
            -ShortcutFilePath (Join-Path $programsPath 'GUSEK.lnk') `
            -TargetPath $targetPath `
            -WorkingDirectory $workingDirectory
    }
}

if (-not $packageParameters.NoDesktopShortcut) {
    $desktopPath = [Environment]::GetFolderPath('DesktopDirectory')
    if ([string]::IsNullOrWhiteSpace($desktopPath)) {
        Write-Warning 'The current account has no desktop folder; skipping its shortcut.'
    } else {
        Install-ChocolateyShortcut `
            -ShortcutFilePath (Join-Path $desktopPath 'GUSEK.lnk') `
            -TargetPath $targetPath `
            -WorkingDirectory $workingDirectory
    }
}
