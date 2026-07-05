$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.7/windows/Modrinth%20App_0.15.7_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '577ca614566298410caad7c5d1d3a29327db916134b9f4a47c74b6e47d825a3a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
