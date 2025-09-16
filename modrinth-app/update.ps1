Import-Module AU

$releases = 'https://launcher-files.modrinth.com/updates.json?new'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $data = Invoke-WebRequest -Uri $releases | ConvertFrom-Json
    $url = $data.platforms.'windows-x86_64'.install_urls | Where-Object { $_ -match '_x64-setup\.exe' }
    $version = ($url -split '_')[1]
	
    return @{ Version = $version; URL64 = $url }
}

Update-Package -ChecksumFor none