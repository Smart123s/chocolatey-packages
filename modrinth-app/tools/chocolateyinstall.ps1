$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.4/windows/Modrinth%20App_0.13.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '5c064741395d5d64f8e489a5a9140a9233e5df9816484ff4545a12854451660b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
