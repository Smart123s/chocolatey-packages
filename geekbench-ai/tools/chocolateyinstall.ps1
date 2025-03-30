$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/GeekbenchAI-1.3.0-WindowsSetup.exe'

  softwareName  = 'Geekbench AI'

  checksum64    = '2047e935e1370e1f0ceb3023d1940a4e9e796a17bdc7e3435db841031b1ea65a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
