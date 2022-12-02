$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-5.4.6-WindowsSetup.exe'

  softwareName  = 'Geekbench 5'

  checksum64    = '8e585c85371ff707cfee97109d03de5f5fe944e4f10f6ed36511cc659b8485f2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
