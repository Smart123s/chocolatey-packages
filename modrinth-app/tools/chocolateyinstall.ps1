$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.20.2/windows/Modrinth%20App_0.20.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'b6a09f8cd8535588cd141b18be5fcedbbaeccb36c8de83876ffd3e9224f2a493'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
