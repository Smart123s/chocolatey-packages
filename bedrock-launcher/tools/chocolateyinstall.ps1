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
  url64         = 'https://github.com/BedrockLauncher/BedrockLauncher/releases/download/2025.8.25.24/BedrockLauncher.2025.8.25.24.zip'

  checksum64    = '77e50744a5ce9aabaa04350540bf9dd667db49b0a358cbb266cc26444698807f'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir

  shortcutFilePath = "$ProgsFolder\Bedrock Launcher.lnk"
  targetPath       = "$file64Location"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @packageArgs
