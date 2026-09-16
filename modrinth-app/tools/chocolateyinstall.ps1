$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.3/windows/Modrinth%20App_0.21.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'e3c5c46391051c6f980f29009fe52b9b907709f8ad690b241ca38fef6be7fcb9'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
