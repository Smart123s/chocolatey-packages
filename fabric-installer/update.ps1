import-module au

$releases = 'https://meta.fabricmc.net/v2/versions/installer'

function global:au_SearchReplace {
    @{
        ".\tools\VERIFICATION.txt" = @{
          "(?i)(Download:).*"   = "`${1} $($Latest.URL32)"
          "(?i)(sha256:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.FileType = $Latest.URL32 -split '\.' | select -last 1
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "fabric-installer"
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $version = $download_page.version | select -First 1

    # The API returns .jar files only. It's easier to use the .exe installer on Windows
    $url = "https://maven.fabricmc.net/net/fabricmc/fabric-installer/$version/fabric-installer-$version.exe"
    
    @{
       URL32     = $url
       Version = $version
    }
}

try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}