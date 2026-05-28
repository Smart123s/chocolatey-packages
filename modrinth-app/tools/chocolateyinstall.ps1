$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.0/windows/Modrinth%20App_0.14.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ec2491b33667fcc6c94c035885ac4749a2ddb96718dc737494ae55428167062b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
