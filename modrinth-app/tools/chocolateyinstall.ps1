$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.27/windows/Modrinth%20App_0.10.27_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '2a087812f2f3fc57ebc8bf10c1aab027c67cfd3e5edda27a274783d90df72a7c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
