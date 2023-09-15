$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1153.1'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'http://edgedl.me.gvt1.com/edgedl/release2/Nearby/adeqjmpid4vfr743qhg27vintn5q_1.0.1153.1/better_together.msi'
  checksum64             = '0324daf9a43505315496e63274fed25062bbf582f69e9f4317aaff388214f816'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
