$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.11/windows/Modrinth%20App_0.15.11_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '2a4108229f00ea6f825ffeb21d099f0aff5cf24807e07e02f556e0485d0b3a3b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
