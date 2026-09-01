$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.19.2/windows/Modrinth%20App_0.19.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'c135253d36449d517ca41ebebaafb71ea3301ec6fbe289569feab226d876889a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
