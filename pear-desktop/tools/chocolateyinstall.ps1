$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  
url           = 'https://github.com/pear-devs/pear-desktop/releases/download/v3.12.1/YouTube-Music-Web-Setup-3.12.1.exe'
checksum      = '816cff2a45aa2dc21e4f864f1f00abaa11bbaf21b2150338f978c66ce37baca2'

  checksumType  = 'sha256'
  
  softwareName  = 'YouTube Music *' 

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
