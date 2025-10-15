$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.11/windows/Modrinth%20App_0.10.11_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '3604febc8269f48914d5fbae9eabc228e1517750c54171111cca77d6276d629f'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
