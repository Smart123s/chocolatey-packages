$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/GeekbenchAI-1.4.0-WindowsSetup.exe'

  softwareName  = 'Geekbench AI'

  checksum64    = '5971f8712363bd4b4b94112f6d453506cd651bd3f7e97b3a805da953027d36b6'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
