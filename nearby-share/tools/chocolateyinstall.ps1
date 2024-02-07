$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1444.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'https://www.google.com/dl/release2/Nearby/punp3egidmlb2i7puxqm7obsmq_1.0.1444.0/better_together.msi'
  checksum64             = '1502d36aff6fd1f9f74a38c7fe902c168a136601eda8128f852905945664ff76'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
