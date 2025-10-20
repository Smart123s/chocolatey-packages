$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.13/windows/Modrinth%20App_0.10.13_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'c28392722598814d951fa9c2eb1a3bbd7d7cae9b65a09af82431c2e50b06a1a2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
