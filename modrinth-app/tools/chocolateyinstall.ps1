$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.20.4/windows/Modrinth%20App_0.20.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '4e99a37ce6fac8fd6b3aa330c4e43cf336c205fbb510ab29d929dfd37036903e'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
