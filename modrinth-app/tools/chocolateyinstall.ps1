$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.20.3/windows/Modrinth%20App_0.20.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '7aa8f6bef4b777ea1e3098af0a7f74bc2f4b0df6cb7f7c3339ce7c0c5daad0f4'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
