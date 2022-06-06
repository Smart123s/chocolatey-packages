import-module au

$releases = 'https://github.com/jellyfin/jellyfin-media-player/releases/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"          
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url32 = $download_page.links | ? href -match '.windows-x86.exe$' | % href | select -First 1
    $url64 = $download_page.links | ? href -match '.windows-x64.exe$' | % href | select -First 1
    $version = ($url32 -split '/' | select -Last 1 -Skip 1).Replace('v','')

    @{
       URL32   = 'https://github.com' + $url32
       URL64   = 'https://github.com' + $url64
       Version = $version
    }
}

try {
    update
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}