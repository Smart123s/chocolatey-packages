$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-7.1.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 7'

  checksum64    = '0a388e786de3978d57e28561fee4e1703c312853faaf79dcc8690cc225885669'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
