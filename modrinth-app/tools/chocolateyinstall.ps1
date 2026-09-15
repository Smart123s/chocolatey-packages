$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.2/windows/Modrinth%20App_0.21.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '8805c78c233a494bf04f70fcd4412f36bc70e7f1a374b9540843e48175516b04'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
