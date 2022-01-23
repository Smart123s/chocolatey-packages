$ErrorActionPreference = 'Stop'
$silentArgs            = "/qn /norestart REBOOT=ReallySuppress STARTUI=0 /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://secure.logmein.com/hamachi.msi'

  softwareName  = 'LogMeIn Hamachi'

  checksum      = '67efb9aa0b7ca0166078edd04ea5f09234c11ac45cb00d31367b9fbce290c53f'
  checksumType  = 'sha256'

  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
