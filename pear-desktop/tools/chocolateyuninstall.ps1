$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'YouTube Music *'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $uninstallString = $_.UninstallString
    
    if ($uninstallString -match '(?i)^"([^"]+)"') {
        $uninstallerPath = $matches[1]
    } elseif ($uninstallString -match '(?i)^(.+\.exe)') {
        $uninstallerPath = $matches[1]
    } else {
        $uninstallerPath = $uninstallString -replace '"', ''
    }

    $packageArgs['file'] = $uninstallerPath
    $installDir = Split-Path -Parent $uninstallerPath
    $packageArgs['silentArgs'] += " _?=$installDir"

    Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$($packageArgs['packageName']) has already been uninstalled by other means."
} else {
  Write-Warning "Multiple matches found for $($packageArgs['softwareName']). No programs will be uninstalled to prevent accidental data loss."
}
