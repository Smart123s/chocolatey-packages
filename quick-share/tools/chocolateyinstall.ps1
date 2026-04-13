$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2555.1'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://edgedl.me.gvt1.com/edgedl/release2/Nearby/ac44miebw7yz7ds6unlpofdz77sa_1.0.2555.1/better_together.msi'
  checksum64             = '175c6c878b86c8f7b37fc95747d150bfba9a5e823c2f653a4c763e0b94aebcef'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
