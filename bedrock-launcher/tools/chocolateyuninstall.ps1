$ErrorActionPreference = 'Stop'

# Place shortcuts in appropriate location
$ProgsFolder = [environment]::getfolderpath('Programs')
If ( Test-ProcessAdminRights ) {
  $ProgsFolder = Join-Path ([environment]::getfolderpath('CommonApplicationData')) "Microsoft\Windows\Start Menu\Programs"
}

Remove-Item -Path "$ProgsFolder\Bedrock Launcher.lnk" -ea 0
