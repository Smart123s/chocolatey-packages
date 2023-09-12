$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.2.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '42dfe80ad174668eee591af41d0f887b158413acf461cd09dce64e2ad7397357'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
