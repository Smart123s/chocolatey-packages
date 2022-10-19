import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\VERIFICATION.txt" = @{
          "(?i)(Download:).*"    = "`${1} $($Latest.URL64)"
          "(?i)(sha256:).*"      = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.FileType = $Latest.URL64 -split '\.' | select -last 1
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "FModel"
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "iAmAsval" -Repository "FModel"

    $url = $download_page.links | ? href -match '.zip$' | % href | select -First 1
    $version = ($url -split '/' | select -Last 1 -Skip 1).Replace('v','')

    @{
       URL64   = 'https://github.com' + $url
       Version = $version
    }
}

try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}