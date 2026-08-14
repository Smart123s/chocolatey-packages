$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.7/windows/Modrinth%20App_0.17.7_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '68666393c1a168876bc076eb62e68f94a0850d4d34ec547cef827a51eb824b64'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
