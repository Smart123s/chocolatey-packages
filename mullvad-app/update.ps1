Import-Module AU
Add-Type -AssemblyName System.Web

$releases = 'https://mullvad.net/en/download/vpn/windows'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"          
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.url
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    [regex]$regex  = '(?:.*Latest version: )(\d+.\d+)'
    $version       = $regex.Matches($download_page.content).Value.Split(' ') | Select -Last 1
    $url           = "https://mullvad.net/media/app/MullvadVPN-" + $version + ".exe"
	
    return @{ Version = $version; URL = $url }
}

Update-Package -ChecksumFor none