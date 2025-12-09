$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://github.com/cake-tech/cake_wallet/releases/download/v5.6.1/Cake_Wallet_v5.6.1_Windows.exe'

  softwareName  = 'Cake Wallet *'

  checksum64    = '75e1de007ce16cf47ab710bcc29b3ed0e3df99a021ead1961580096fcbe20684'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /NORESTART'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
