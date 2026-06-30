$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.4/windows/Modrinth%20App_0.15.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'cbabc46110e688943e59cef475460fa28493b325419b02ccbef66e9af32dea7d'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
