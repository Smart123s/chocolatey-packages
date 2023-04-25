$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://dl.google.com/tag/s/appguid={232066FE-FF4D-4C25-83B4-3F8747CF7E3A}&usagestats=0&needsadmin=true/better_together/BetterTogetherSetup.exe'

  softwareName  = 'Tresorit'

  checksum64    = '98A93C17334A19EF86C153ECAE7BB7282668D9769115ABD313CDB7BFF1E4D499'
  checksumType  = 'sha256'

  silentArgs    = '/s /v"/qn"'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
