$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.1/windows/Modrinth%20App_0.15.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'a8691922461ed1d18c11e0056a557e7f42c0f56467558ccc589713df3871cb8a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
