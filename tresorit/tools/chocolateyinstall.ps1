$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://installerstorage.blob.core.windows.net/public/install/Tresorit.exe'

  softwareName  = 'Tresorit'

  checksum64    = '5AF96EBA42CEE2D73B45DBE5F76224404B034313B7C89058F2FD5C90481AEADB'
  checksumType  = 'sha256'

  silentArgs    = '/s /v"/qn"'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
