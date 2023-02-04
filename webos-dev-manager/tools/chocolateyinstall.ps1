$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.5/webOS.Dev.Manager_1.9.5_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.5/webOS.Dev.Manager_1.9.5_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '90684e94df8a50788f3ac7a164b02e7b4db25cc7706736dd6323cc9e1fd38097'
  checksum64    = '264a890ba9a3e0d11f05fa0a9e0293160ad928eda22ac6a7c359239960001dd5'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
