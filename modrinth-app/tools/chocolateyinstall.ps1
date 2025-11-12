$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.19/windows/Modrinth%20App_0.10.19_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '9ee27fb4baa79f96da82181807bc4dd28e51a84dae2862d7ea40c749de6f252e'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
