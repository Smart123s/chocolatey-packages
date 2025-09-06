$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.5.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = 'a983194a982a86ed64ba63183f1fc914089eb6c7006373fe6e8623fe372d80af'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
