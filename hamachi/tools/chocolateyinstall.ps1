$ErrorActionPreference = 'Stop'
$silentArgs            = "/qn /norestart REBOOT=ReallySuppress STARTUI=0 /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://secure.logmein.com/hamachi.msi'

  softwareName  = 'LogMeIn Hamachi'

  checksum      = '6ee98db32852a2ff31a969d918bb7c730950bb15f24ea1baf996697cebc8b9fa'
  checksumType  = 'sha256'

  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
