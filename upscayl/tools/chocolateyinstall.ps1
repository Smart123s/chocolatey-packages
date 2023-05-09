$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.5.1/upscayl-2.5.1-win.exe'
  checksum64    = '46ca04b09b08a780de0e6b8ffdf243a8c7f46c69bb756ee7c32b604ae44cdd0a'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
