$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.1.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '43543bf8a2594f0f46747f0cbd2102e8927fe92f96c14f27c80dfecffcf9ccbb'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
