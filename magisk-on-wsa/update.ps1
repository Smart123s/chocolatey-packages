import-module au

$releases = @(
    # Main repo throws 404 at nightly.link. Maybe GitHub is blocking API access?
    # 'https://github.com/LSPosed/MagiskOnWSA/actions?query=event%3Aworkflow_dispatch+is%3Asuccess++',
    'https://github.com/Dr-TSNG/MagiskOnWSA/actions?query=event%3Aworkflow_dispatch+is%3Asuccess++',
    'https://github.com/Howard20181/MagiskOnWSA/actions?query=event%3Aworkflow_dispatch+is%3Asuccess++'
)

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
    $version = 0;

    foreach ($release in $releases) {
        $download_page = Invoke-WebRequest -Uri $release -UseBasicParsing

        $url64 = $download_page.links | ? href -match 'runs' | % href | select -First 1
        $ver = ($url64 -split '/' | select -Last 1)
        if ($ver -gt $version) {
            $version = $ver;
            $owner = ($url64 -split '/' | select -First 1 -Skip 1)
        }
    }

    $releases = "https://nightly.link/" + $owner + "/MagiskOnWSA/actions/runs/" + $version
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url64 = $download_page.links | ? href -match 'x64' | % href | select -First 1 -Skip 1

    @{
        URL64   = $url64
        Version = '1.' + $version.Insert(6, ".")
    }
}

update -ChecksumFor none
