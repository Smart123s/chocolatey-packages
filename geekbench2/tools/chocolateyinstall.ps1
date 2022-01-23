$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://cdn.primatelabs.com/Geekbench-2.4.3-WindowsSetup.exe'

  softwareName  = 'Geekbench 2.4'

  checksum      = 'fba8ac3eae625b6c64ec24cf88ea442d35f38013e16af8a4683910fa44ef61d5'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
