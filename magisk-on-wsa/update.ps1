import-module au

$releases = 'https://github.com/yujincheng08/MagiskOnWSA/actions?query=event%3Aworkflow_dispatch+is%3Asuccess++'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url64 = $download_page.links | ? href -match 'runs' | % href | select -First 1
    $version = ($url64 -split '/' | select -Last 1)

    $releases = "https://nightly.link/yujincheng08/MagiskOnWSA/actions/runs/" + $version
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url64 = $download_page.links | ? href -match 'x64' | % href | select -First 1 -Skip 1

    @{
        URL64   = $url64
        Version = '1.' + $version.Insert(6, ".")
    }
}

update -ChecksumFor none
