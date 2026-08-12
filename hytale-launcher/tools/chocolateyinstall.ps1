$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher.hytale.com/builds/release/windows/amd64/hytale-launcher-installer-latest.exe'

  softwareName  = 'Hytale Launcher'

  checksum64    = '5DDE5DBF4375C220810C5B99D51318CF9C3A98CF89E922DD026E203AEDD641E2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
