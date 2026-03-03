$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.11.1/windows/Modrinth%20App_0.11.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ff50d885fd90698071e19dd2a82347dd0fd660bb2dd92e23e36240dbd459fb29'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
