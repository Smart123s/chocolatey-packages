import-module au

$releases = 'https://github.com/AfoninZ/UltimMC/actions/workflows/main.yml?query=is%3Asuccess'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"          
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
		}
    }
}


function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url32 = $download_page.links | ? href -match 'runs' | % href | select -First 1
    $version = ($url32 -split '/' | select -Last 1)

    $releases = "https://nightly.link/AfoninZ/UltimMC/actions/runs/" + $version
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = $download_page.links | ? href -match 'win32' | % href | select -First 1 -Skip 1

    @{
        URL32   = $url32
        Version = '1.' + $version.Insert(6, ".")
    }
}

update -ChecksumFor none
