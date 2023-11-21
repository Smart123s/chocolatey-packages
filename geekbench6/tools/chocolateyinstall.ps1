$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://cdn.geekbench.com/Geekbench-6.2.2-WindowsSetup.exe'

  softwareName  = 'Geekbench 6'

  checksum64    = '7487405c4860595e93db6ca8b830aeb20e46bbf7e107da81553634d4373dc701'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
