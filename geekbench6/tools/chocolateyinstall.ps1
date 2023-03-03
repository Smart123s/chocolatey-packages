$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.0.1-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '6a0abd8c583a6c924103f93c6e32c112d05c858db9644dc343a41984b2ee9686'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
