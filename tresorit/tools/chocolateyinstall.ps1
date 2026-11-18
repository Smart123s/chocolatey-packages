$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://installerstorage.blob.core.windows.net/public/install/Tresorit.exe'

  softwareName  = 'Tresorit'

  checksum64    = '218FD0259FBE7205A1E0B803A33B29B3FF39DCCB93A9963B664D852D3CBEAE2A'
  checksumType  = 'sha256'

  silentArgs    = '/s /v"/qn"'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
