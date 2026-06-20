$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.8/windows/Modrinth%20App_0.14.8_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'f4b72b602c53fe337c84d13d5e0aaba68b4f9246aaea2a44078033755efca7f0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
