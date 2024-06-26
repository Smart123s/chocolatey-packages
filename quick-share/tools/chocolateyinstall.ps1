﻿$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1637.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'http://edgedl.me.gvt1.com/edgedl/release2/Nearby/ag6ue7v7ztbpiegjfgfhxidj3m_1.0.1637.0/better_together.msi'
  checksum64             = 'f83c321876ea1b66adb3a9dfe7837379b850185ba73d18f1e57e3cdfc9406602'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
