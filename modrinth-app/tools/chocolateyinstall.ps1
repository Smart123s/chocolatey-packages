$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.10/windows/Modrinth%20App_0.10.10_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'f2a56b2aafb581bc8d29db3cac735babebfb1ac40c811b3668ae65f724bee9b0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
