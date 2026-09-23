$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.5/windows/Modrinth%20App_0.21.5_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'e8904effec07201312f7c850aac12d297c4255e383a77f6c6a601e4c27659852'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
