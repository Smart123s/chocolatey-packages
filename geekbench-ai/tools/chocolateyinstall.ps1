$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/GeekbenchAI-1.6.0-WindowsSetup.exe'

  softwareName  = 'Geekbench AI'

  checksum64    = 'e3aeb71ced7d5783dbc188404e787e6756f2178a068a45da4d9f7fa3a068dc23'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
