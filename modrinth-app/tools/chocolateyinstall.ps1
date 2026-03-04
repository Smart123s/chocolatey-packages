$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.11.2/windows/Modrinth%20App_0.11.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '30b42bcf069693bd3f36692da8605ad49f865e404362caa0eaeccc06eecac991'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
