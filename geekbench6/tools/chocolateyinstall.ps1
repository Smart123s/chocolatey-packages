$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.6.0-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '1575778c0f55cf1cbbfb6c559f6d952f220e39b04c8bf69950d763862912582b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
