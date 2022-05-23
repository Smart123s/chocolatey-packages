$ErrorActionPreference = 'Stop'
$silentArgs            = "/qn /norestart REBOOT=ReallySuppress STARTUI=0 /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://secure.logmein.com/hamachi.msi'

  softwareName  = 'LogMeIn Hamachi'

  checksum      = '19599ebcc20574aabff6816f78580711cd416ac545aacaf47ea4cff2f615d3b1'
  checksumType  = 'sha256'

  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
