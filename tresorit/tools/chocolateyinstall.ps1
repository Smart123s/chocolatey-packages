$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://installerstorage.blob.core.windows.net/public/install/Tresorit.exe'

  softwareName  = 'Tresorit'

  checksum64    = '9F89E8CAE794A057C528B1854016C4FC0AEBE8D9281C6776B1C7C8F761136D5C'
  checksumType  = 'sha256'

  silentArgs    = '/s /v"/qn"'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
