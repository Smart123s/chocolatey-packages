$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.5/windows/Modrinth%20App_0.14.5_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'cc617331430b51473a5bb5b999d53f9caa1ce7a41e021f8622b5e603ac645f73'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
