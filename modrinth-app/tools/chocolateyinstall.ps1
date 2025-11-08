$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.17/windows/Modrinth%20App_0.10.17_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '4a86b1aa49ed1735d40f8cecd7c48b6ecdc0ccc1848ba705bed8b960fd70a777'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
