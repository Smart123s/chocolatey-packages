$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://installerstorage.blob.core.windows.net/public/install/Tresorit.exe'

  softwareName  = 'Tresorit'

  checksum64    = '1FC3FDBCA1AF831258F904B212FB36E0681951B993E69F0139FDDCCB26BCEBC1'
  checksumType  = 'sha256'

  silentArgs    = '/s /v"/qn"'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
