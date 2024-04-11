$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.3.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '52051ae6051e4219f058ff73a08a37f0ecfa3bde2005114881ac454598be7cd1'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
