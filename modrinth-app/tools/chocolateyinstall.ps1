$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.12.1/windows/Modrinth%20App_0.12.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '9351b0750e2dcf80d54a1bb09cc3538817e340ff552d6d5e641cbec1289c6f13'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
