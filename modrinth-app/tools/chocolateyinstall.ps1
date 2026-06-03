$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.3/windows/Modrinth%20App_0.14.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'eb371319ed912ffee3b51ff3358051ae77e8daad61f8b02367499b5ceee80aab'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
