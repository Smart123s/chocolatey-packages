$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.0.3-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '7f28e35c6d6898921fb14c8146c6b3ede5463f9351908a85b453575c18cc4515'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
