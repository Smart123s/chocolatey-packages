$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/k9ea2vqm/Geekbench-6.0.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '642acb59a87cf9fabef43231202e9f795357856d07862a5649a580f150a21c4b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
