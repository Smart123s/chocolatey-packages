$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.22/windows/Modrinth%20App_0.10.22_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '09e051e1c9d86f60add317754e20882f27bce6c60cfa4a77484f82981ed50d1e'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
