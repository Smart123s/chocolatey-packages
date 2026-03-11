$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.11.4/windows/Modrinth%20App_0.11.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '46f02806e728824c1b801d44c26b0bacadae7e99f4512da117ce97486a26619e'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
