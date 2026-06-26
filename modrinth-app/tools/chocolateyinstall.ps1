$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.0/windows/Modrinth%20App_0.15.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '1112d1986303f385cf2ed6588dbbc58a7824b88709dfe3377c519b8f6c66af25'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
