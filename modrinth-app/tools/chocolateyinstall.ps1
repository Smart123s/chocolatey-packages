$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.18/windows/Modrinth%20App_0.13.18_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'afd2542891c7767380bd813543489bfa570d731cbfa7492bb0034d11805b8348'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
