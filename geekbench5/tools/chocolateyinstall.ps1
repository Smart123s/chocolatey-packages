$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-5.4.5-WindowsSetup.exe'

  softwareName  = 'Geekbench 5'

  checksum64    = 'c58a8712c72277d197b378db41df0b0a2dfe65ca6082a443be37aeeea1a3915d'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
