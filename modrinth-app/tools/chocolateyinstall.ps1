$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.5/windows/Modrinth%20App_0.17.5_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '76aa47ba507f59c24dd864f8f3762d24b84002a27afa4e4e36fa50fa6533869c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
