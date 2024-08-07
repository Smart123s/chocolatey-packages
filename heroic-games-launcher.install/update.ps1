import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')"              = "`$1'$($Latest.URL64)'"          
            "(checksum64\s*=\s*)('.*')"         = "`$1'$($Latest.Checksum64)'"
            "(softwareName\s*=\s*'Heroic)(.*)'" = "`$1 $($Latest.Version)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "Heroic-Games-Launcher" -Repository "HeroicGamesLauncher"

    $url64 = $download_page.links | ? href -match '-Setup-x64.exe$' | % href | select -First 1
    $version = ($url64 -split '/' | select -Last 1 -Skip 1).Replace('v', '')

    @{
        URL64   = 'https://github.com' + $url64
        Version = $version
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    # run the update only if script is not sourced
    Update-Package -checksumfor none
}
