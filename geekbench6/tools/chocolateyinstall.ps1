$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.2.1-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = 'd7f8e8f0965685096748b2e523204665fe297de9438e107a2487bfde20343f8f'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
