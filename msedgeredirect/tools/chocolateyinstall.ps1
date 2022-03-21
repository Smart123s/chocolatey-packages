$ErrorActionPreference = 'Stop';
$toolsDir   =	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$configFile = Join-Path $toolsDir 'Setup.ini'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'

  file           = Join-Path $toolsDir 'MSEdgeRedirect_x32.exe'
  checksum       = '2C9489C91212019F4BA74834A1659A7E68A9F204F6A492CA66D2ED28E900105F'

  file64         = Join-Path $toolsDir 'MSEdgeRedirect_x64.exe'
  checksum64     = 'FDFF47E3974322E8040D8F69DACCE71219C68E0D00097C168A666FE5B69C17DA'

  softwareName   = 'MSEdgeRedirect'
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = "/silentinstall $configFile"
}

Install-ChocolateyPackage @packageArgs

Remove-Item -ea 0 -force -path $toolsDir\*.exe
