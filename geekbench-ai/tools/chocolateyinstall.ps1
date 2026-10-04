$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/GeekbenchAI-1.8.0-WindowsSetup.exe'

  softwareName  = 'Geekbench AI'

  checksum64    = 'ce00c86503bc9321de333d3abdab3dc4611f4fbce8be2c21978c038e1e81de13'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
