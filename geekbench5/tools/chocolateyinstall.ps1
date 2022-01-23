$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-5.4.4-WindowsSetup.exe'

  softwareName  = 'Geekbench 5'

  checksum64    = '1c7697045339fb6790abbb945f0545290dbaa01b51ac5ec99ee5bd9c42d30d43'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
