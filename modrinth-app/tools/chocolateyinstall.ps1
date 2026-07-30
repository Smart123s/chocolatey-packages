$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.3/windows/Modrinth%20App_0.17.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '0e4ffd823efbe9edea9c85836bf760737519f27962447906c0b7f145c6594948'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
