import-module au

$releases = 'https://github.com/bepaald/signalbackup-tools/releases'

function global:au_SearchReplace {
    @{
        ".\tools\VERIFICATION.txt" = @{
          "(?i)(Download:).*"   = "`${1} $($Latest.URL64)"
          "(?i)(sha256:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate {
    rm $PSScriptRoot\tools\* -Recurse -Force -Exclude "VERIFICATION.txt","LICENSE.txt"
    iwr $Latest.URL64 -OutFile "$PSScriptRoot\tools\signalbackup-tools.exe"
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url = $download_page.links | ? href -match '.exe$' | % href | select -First 1

    # Raw version from URL: 20211224-2
    $version = "$( $url -split '/' | select -Last 1 -Skip 1 )"

    # Convert version to choco format
    $version = $version.Insert(6, ".").Insert(4, ".").Replace("-", ".")

    $checksum = (Get-FileHash "$PSScriptRoot\tools\signalbackup-tools.exe").Hash

    @{
       URL64   = 'https://github.com' + $url
       Version = $version
       Checksum64 = $checksum
    }
}

try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}

update