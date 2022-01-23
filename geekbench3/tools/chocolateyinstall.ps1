$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://cdn.geekbench.com/Geekbench-3.4.4-WindowsSetup.exe'

  softwareName  = 'Geekbench 3'

  checksum      = 'a0cc138cf5727a2ad1920266f4465c6b4ebf3521439fb37457f1c452d5acc762'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
