$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.1/windows/Modrinth%20App_0.13.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '2cfc5425665ea0cee68b553ea412e79b22c70c0dbe522f5aefbb4fa49c5f7b59'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
