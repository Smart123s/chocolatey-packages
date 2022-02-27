import-module au

$releases = 'https://github.com/rcmaehl/MSEdgeRedirect/releases/latest'

function global:au_SearchReplace {
    @{
        ".\tools\VERIFICATION.txt" = @{
          "(?i)(Download x32:).*"   = "`${1} $($Latest.URL32)"
          "(?i)(sha256 x32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(Download x64:).*"   = "`${1} $($Latest.URL64)"
          "(?i)(sha256 x64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        "tools\chocolateyinstall.ps1" = @{
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
    }
}

function global:au_BeforeUpdate {
    $Latest.FileType = $Latest.URL32 -split '\.' | select -last 1
    Get-RemoteFiles -Purge -FileNameBase "MSEdgeRedirect"
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url32 = $download_page.links | ? href -match '.exe$' | % href | select -First 1 -Skip 1
    $url64 = $download_page.links | ? href -match '.exe$' | % href | select -First 1
    $version = ($url32 -split '/' | select -Last 1 -Skip 1).Replace('v','')

    @{
        URL32   = 'https://github.com' + $url32
        URL64   = 'https://github.com' + $url64
        Version = $version
    }
}

try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}