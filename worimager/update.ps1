Import-Module AU
Add-Type -AssemblyName System.Web

$releases = 'https://www.worproject.com/downloads/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"          
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
		}
        "tools\chocolateyuninstall.ps1" = @{
            # TODO: This gets screwed up, if a fix notation is used in version
            "(Uninstall-ChocolateyZipPackage.*)('.*')" = "`$1'WoR_Release_$($Latest.Version).zip'"
		}
	}
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.url
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $regex         = '.*WoR-Release-.*'
    $encodedUrl    = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $url           = ([System.Web.HttpUtility]::UrlDecode($encodedUrl) -Split "url=")[1]
    $version       = ($url -split '-' | select -Last 1).Replace("?dl=1", "")
	
    return @{ Version = $version; URL = $url }
}

Update-Package -ChecksumFor none