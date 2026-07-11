$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.10/windows/Modrinth%20App_0.15.10_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '6064738c3cc5e15b4e634edd9b0acffbe68c1e185751eb21ba2044884b5ca2e9'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
