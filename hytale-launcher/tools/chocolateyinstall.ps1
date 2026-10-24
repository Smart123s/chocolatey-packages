$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher.hytale.com/builds/release/windows/amd64/hytale-launcher-installer-latest.exe'

  softwareName  = 'Hytale Launcher'

  checksum64    = 'C88F003D9F876D02BD0AC0177A92CB0CBC3E047DB2DD1A3069EDF755EDC250CC'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
