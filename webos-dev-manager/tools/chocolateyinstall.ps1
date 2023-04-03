$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.4/webOS.Dev.Manager_1.11.4_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.4/webOS.Dev.Manager_1.11.4_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'bab801a1447509cb5147c8eeea82977cad7b5b471069b79b593128970da51442'
  checksum64    = '32219094bffffc67670170ce0f97b4a1d367d977f3bdaed330dbc007b8df2576'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
