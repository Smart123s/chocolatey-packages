$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-5.5.1-WindowsSetup.exe'

  softwareName  = 'Geekbench 5'

  checksum64    = '86ceab47fc04510688191fc5832f1f870d4f743c914a16409600f64e8a86bd31'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
