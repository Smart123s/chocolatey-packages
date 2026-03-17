$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.12.4/windows/Modrinth%20App_0.12.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '58188b31908a7d0b64fe290613550b8e38f68457db65e443d8d20cb8bada2bd9'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
