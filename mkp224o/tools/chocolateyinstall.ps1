$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/cathugger/mkp224o/releases/download/v1.7.0/mkp224o-1.7.0-w32.zip'
  url64         = 'https://github.com/cathugger/mkp224o/releases/download/v1.7.0/mkp224o-1.7.0-w64.zip'

  checksum      = '390433a650c3c39ea92bb2d0f219889cf96faaa6cb61f6024e0e133b409b43e2'
  checksum64    = '406b37ce331768a53051a050a84c18289ecbbf762fafaa28cd2a41dc95e55115'
  checksumType  = 'sha256'

  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
