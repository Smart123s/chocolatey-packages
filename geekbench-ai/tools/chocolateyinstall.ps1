$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/GeekbenchAI-1.5.0-WindowsSetup.exe'

  softwareName  = 'Geekbench AI'

  checksum64    = '72a9af42c048df05b331ee4997a16a4d2e7482d6f7df4999cd95b4f5606443d2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
