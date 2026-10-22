$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.22.0/windows/Modrinth%20App_0.22.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '7275eee11220128f4c5697186b7d27bb8016534ab7b573194a6040998c0839bc'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
