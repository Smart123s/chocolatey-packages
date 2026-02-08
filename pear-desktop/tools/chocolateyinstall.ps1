$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  
  # 32-bit (Unified Installer)
url           = 'https://github.com/pear-devs/pear-desktop/releases/download/v3.11.0/YouTube-Music-Web-Setup-3.11.0.exe'
checksum      = '62ff8b86c44ff0e2cf4a4eb940bb689be38ef2fb7ebe3783c3f5f15f1b6fea3c'

  # 64-bit (Unified Installer)
  url64         = 'https://github.com/pear-devs/pear-desktop/releases/download/v3.11.0/YouTube-Music-Web-Setup-3.11.0.exe'
  checksum64    = '62ff8b86c44ff0e2cf4a4eb940bb689be38ef2fb7ebe3783c3f5f15f1b6fea3c'

  checksumType  = 'sha256'
  
  # Updated to match the new software name (Wildcard handles version/naming variations)
  softwareName  = 'YouTube Music Web *' 

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
