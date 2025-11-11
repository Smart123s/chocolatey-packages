$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.18/windows/Modrinth%20App_0.10.18_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '1c46223d9b7d263866a565762e7a329e586cee8a6a371a3ec368ee08d06a8fe0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
