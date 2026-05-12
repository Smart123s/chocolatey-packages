$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.15/windows/Modrinth%20App_0.13.15_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'dc89c5c5d68cda0d9204ced2d9f0b01a90c4cefcca555d7270f0c97842bad2f7'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
