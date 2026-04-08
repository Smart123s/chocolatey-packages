$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.7.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '01f0af1024b536ee6f7884a53dd2c13c978718641ba8d13a219ca1401f6c76ef'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
