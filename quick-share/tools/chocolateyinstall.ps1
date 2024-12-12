$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2034.4'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://edgedl.me.gvt1.com/edgedl/release2/Nearby/pifpbfcnv76q3rn6z5fsz3piui_1.0.2034.4/better_together.msi'
  checksum64             = 'b82ac8c086c6d6e86b8513472767f69627703aecc768d113c9472616ce8ca2e8'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
