$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2600.1'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://www.google.com/dl/release2/Nearby/mvhjolghvsgtf374n5jxq45pqa_1.0.2600.1/better_together.msi'
  checksum64             = '7e74857b8d3c23b23808510647ccf07bc8364eed1195e5fb0fe521ff913fcc8b'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
