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
  url64         = 'https://github.com/BedrockLauncher/BedrockLauncher/releases/download/2025.7.13.17/BedrockLauncher2025.7.13.17.zip'

  checksum64    = '6baf623948308f2e9a58257a65dcd0eec8937a7bf8466ef5b60aec389a1e46b4'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir

  shortcutFilePath = "$ProgsFolder\Bedrock Launcher.lnk"
  targetPath       = "$file64Location"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @packageArgs
