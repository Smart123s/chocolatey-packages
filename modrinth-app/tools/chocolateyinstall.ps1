$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.10/windows/Modrinth%20App_0.17.10_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '026bc32e51b08cd424d607b4f97ce7a2805db71c84715cad2f2791d67ef7de52'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
