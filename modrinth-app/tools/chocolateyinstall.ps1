$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.12.2/windows/Modrinth%20App_0.12.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '7e661fd67123e36a2e7c5855818d40b42b8340c9a6233e826d22e391134791ca'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
