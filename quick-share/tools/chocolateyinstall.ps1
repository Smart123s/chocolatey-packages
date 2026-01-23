$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2472.1'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://edgedl.me.gvt1.com/edgedl/release2/Nearby/gxspypwifhwblultytho5huyiu_1.0.2472.1/better_together.msi'
  checksum64             = '4f55786dbb89478209ad4c17051cb7a8e37ebc4331506a53e3b06ddf53750444'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
