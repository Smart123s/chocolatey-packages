$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.12.6/windows/Modrinth%20App_0.12.6_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'd992103ba927092b6391d771d9a0c22a324a38c044e4dd3c335f18c3457321bb'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
