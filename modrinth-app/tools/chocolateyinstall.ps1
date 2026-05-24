$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.22/windows/Modrinth%20App_0.13.22_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '09fc8a3097642dd281298eb9006a9bb48a2b31ba32acba8c58ca6714c470e2b0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
