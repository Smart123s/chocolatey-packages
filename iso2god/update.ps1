import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "r4dius" -Repository "Iso2God"

    $url64 = $download_page.links | ? href -match '\.zip$' | % href | select -First 1
    $version = ($url64 -split 'v' | select -Last 1).Replace('.zip','')

    @{
        URL64   = 'https://github.com' + $url64
        Version = $version
    }
}

update -ChecksumFor none
