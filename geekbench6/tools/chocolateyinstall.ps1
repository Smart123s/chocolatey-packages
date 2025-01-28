$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.4.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '4e46a831ba4d8baadbbdb40a499d9228f800037d48b905182887ab3d00f67654'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
