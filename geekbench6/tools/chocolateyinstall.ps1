$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.0.2-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = 'aef0f725d9054400bfc596eabcd29a18b44fdcaf5252ebcbbf1b5afba073aa2c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
