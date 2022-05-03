Import-Module AU

$releases = 'https://en.miui.com/unlock/download_en.html'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"          
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
		}
        "tools\chocolateyuninstall.ps1" = @{
            "(Uninstall-ChocolateyZipPackage.*)('.*')" = "`$1'miflash_unlock-en-$($Latest.Version).zip'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.url
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $regex         = '.*miflash_unlock-en-.*?.zip'
    $url           = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $version       = ($url -split '-' | select -Last 1).trim(".zip")
	
    return @{ Version = $version; URL = $url }
}

Update-Package -ChecksumFor none