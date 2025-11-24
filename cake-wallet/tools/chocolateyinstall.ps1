$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://github.com/cake-tech/cake_wallet/releases/download/v5.5.0/Cake_Wallet_v5.5.0_Windows.exe'

  softwareName  = 'Cake Wallet *'

  checksum64    = 'dc3c01aecea53568f47631336e947d0e3e45b86634a69beebbaaee1bc630f70c'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /NORESTART'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
