$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2697.0'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/adqewi63qp6gvwdy5dgjk4ehmj3q_1.0.2697.0/better_together.msi'
  checksum64             = 'f210df187fffbbf72b9602eca9d56745ed8da66cef64b973297b584bd11e7584'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
