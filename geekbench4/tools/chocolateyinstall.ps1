$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://cdn.geekbench.com/Geekbench-4.4.4-WindowsSetup.exe'

  softwareName  = 'Geekbench 4'

  checksum      = '651fee8e317547c3e61850ac14ca8c307b458f6f1bf6839cc257d15a5587e270'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
