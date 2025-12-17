$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.23/windows/Modrinth%20App_0.10.23_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'fce627cc3302969386f60131f5f11738662123b5f23edf9f2a89be929aef740b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
