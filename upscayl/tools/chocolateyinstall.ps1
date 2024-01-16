$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.9.7/upscayl-2.9.7-win.exe'
  checksum64    = '90e22428bc0e3741538bf2324f30d2087d3d3eae9251a7c999b2e3a01f146e88'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
