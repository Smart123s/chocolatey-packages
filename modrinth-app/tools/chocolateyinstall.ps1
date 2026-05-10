$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.14/windows/Modrinth%20App_0.13.14_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ebc3e1805cd8b67b56aacf2513d9d9f17bc7353a5dd573938b81a2f165d5d897'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
