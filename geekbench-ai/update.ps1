Import-Module AU

$releases = 'https://www.geekbench.com/ai/download/windows/'

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
    $regex         = '.*-WindowsSetup.exe'
    $url           = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $version       = ($url -split '-' | select -Skip 1 -Last 1)

    if (-not $version.StartsWith('1')) {
        throw 'New major version has been released. Aborting update.'
    }
	
    return @{ Version = $version; URL64 = $url }
}

Update-Package -ChecksumFor none