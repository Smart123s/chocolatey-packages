import-module au

$releases = 'https://github.com/oleksis/youtube-dl-gui/releases'

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
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "yt-dlg"
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url = $download_page.links | ? href -match '.msi$' | % href | select -First 1

    # Raw version from URL: 20211224-2
    $version = "$( $url -split '/' | select -Last 1 -Skip 1 | % SubString 1 )"

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