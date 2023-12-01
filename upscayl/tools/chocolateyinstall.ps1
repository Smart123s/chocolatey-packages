$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.9.4/upscayl-2.9.4-win.exe'
  checksum64    = '6610a0f1bb80facc48300f4e4c320b1bfe2ae00583bbeaed59db05b455bb3904'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
