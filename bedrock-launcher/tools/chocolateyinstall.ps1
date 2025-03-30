$ErrorActionPreference = 'Stop'

# Check Windows version (min: 1607)
if ( [Environment]::OSVersion.Version.Build -lt 14393) {
  Write-Host "  ** Windows 10 build 1607 or later is required." -ForeGround Red
  throw
}

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file64Location = "$toolsDir\BedrockLauncher\app\BedrockLauncher.exe"

# Place shortcuts in appropriate location
$ProgsFolder = [environment]::getfolderpath('Programs')
If ( Test-ProcessAdminRights ) {
  $ProgsFolder = Join-Path ([environment]::getfolderpath('CommonApplicationData')) "Microsoft\Windows\Start Menu\Programs"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url64         = 'https://github.com/BedrockLauncher/BedrockLauncher/releases/download/2024.11.15.4/BedrockLauncher2024.11.15.4.zip'

  checksum64    = 'b4cacc84b6093849fe3145832d005ab347931d4c8a69e3eb5451487d4872189d'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir

  shortcutFilePath = "$ProgsFolder\Bedrock Launcher.lnk"
  targetPath       = "$file64Location"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @packageArgs
