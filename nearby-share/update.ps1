Import-Module AU

$releases = 'https://tools.google.com/service/update2/'
$releases_body = '<?xml version="1.0" encoding="UTF-8"?><request><os platform="win" version="10.0.22000.978" sp="" arch="x64"/><app appid="{232066FE-FF4D-4C25-83B4-3F8747CF7E3A}" version="" nextversion="" lang="en"><updatecheck/></app></request>'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(?i)(^[$]version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
		}
	}
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases -Method Post -Body $releases_body
    $app           = ([xml]$download_page.Content).gupdate.app.updatecheck
    $url           = $app.codebase
    $version       = ($url -split '_' | select -Skip 1 -Last 1).Replace('/better', '')
	
    return @{
        URL64      = $url
        Checksum64 = $app.hash_sha256
        Version    = $version
    }

}

Update-Package -ChecksumFor none
