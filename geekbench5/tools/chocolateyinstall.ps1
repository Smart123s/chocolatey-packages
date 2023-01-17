$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-5.5.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 5'

  checksum64    = '8d260cddee2a8d74b31111de20a696b7d1a4b7e1b81bd1d83bf924f284dc8b79'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
