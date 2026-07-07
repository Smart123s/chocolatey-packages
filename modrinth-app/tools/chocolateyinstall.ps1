$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.8/windows/Modrinth%20App_0.15.8_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '9371c7e1a1633e0f384aa759dcf1555db459aa3bb7d512bd88021466395a6b71'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
