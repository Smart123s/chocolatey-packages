$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  
url           = 'https://github.com/pear-devs/pear-desktop/releases/download/v3.12.0/YouTube-Music-Web-Setup-3.12.0.exe'
checksum      = 'b8edd18bec9791aa9068c6a2baa74346437fa1eb7587393325a6473c00442c71'

  checksumType  = 'sha256'
  
  softwareName  = 'YouTube Music *' 

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
