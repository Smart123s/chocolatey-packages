$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.7.2-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '370764109697e44b62d5ce39dccba1ca3f09d72cf51f4fae0cb1e6f01bd2c811'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
