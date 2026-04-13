$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.0/windows/Modrinth%20App_0.13.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '1d52d6ce0e4682eddf58575920faa78db08df6ebc27f77ad6edcda19eb2aea0d'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
