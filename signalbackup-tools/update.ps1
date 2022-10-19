import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        ".\tools\VERIFICATION.txt" = @{
          "(?i)(Download:).*"   = "`${1} $($Latest.URL64)"
          "(?i)(sha256:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.FileType = $Latest.URL64 -split '\.' | select -last 1
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "signalbackup-tools"
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "bepaald" -Repository "signalbackup-tools"

    $url = $download_page.links | ? href -match '.exe$' | % href | select -First 1

    # Raw version from URL: 20211224-2
    $version = "$( $url -split '/' | select -Last 1 -Skip 1 )"

    # Convert version to choco format
    $version = $version.Insert(6, ".").Insert(4, ".").Replace("-", ".")

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