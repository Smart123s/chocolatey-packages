$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/GeekbenchAI-1.7.0-WindowsSetup.exe'

  softwareName  = 'Geekbench AI'

  checksum64    = 'a5258f63ecee347bde071a672d8a88f2e757eb23b980455a6269f439d1570c7b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
