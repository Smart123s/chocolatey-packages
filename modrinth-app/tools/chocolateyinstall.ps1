$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.24/windows/Modrinth%20App_0.10.24_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '476522cbd9b31c55c4e69448afed59c0f300c7307232ac1639b8efb1bee93c49'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
