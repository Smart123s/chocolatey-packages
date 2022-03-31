$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://installerstorage.blob.core.windows.net/public/install/Tresorit.exe'

  softwareName  = 'Tresorit'

  checksum64    = 'DD463DCEBEE4190356CCB75B3D67AFC442E157A96294DF2DAD2A2D6A31556367'
  checksumType  = 'sha256'

  silentArgs    = '/s /v"/qn"'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
