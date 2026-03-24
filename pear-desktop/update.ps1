import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?m)^\s*(url\s*=\s*)('.*')"       = "`$1'$($Latest.URL)'"
            "(?m)^\s*(checksum\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum32)'"
        }
        "pear-desktop.nuspec" = @{
            "(?i)(<releaseNotes>)(.*)(</releaseNotes>)" = "`$1https://github.com/pear-devs/pear-desktop/releases/tag/v$($Latest.Version)`$3"
        }
    }
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "pear-devs" -Repository "pear-desktop"

    # Match the new filename pattern
    $url64 = $download_page.links | ? href -match 'YouTube-Music-Web-Setup.*\.exe$' | % href | select -First 1
    
    # Extract version from "YouTube-Music-Web-Setup-3.11.0.exe"
    # Matches the number pattern (e.g. 3.11.0) inside the filename
    if ($url64 -match 'Setup-(\d+\.\d+\.\d+)') {
        $version = $matches[1] 
    } else {
        # Fallback if regex fails, though the above is robust for this file format
        $version = ($url64 -split '-' | select -Last 1).Replace('.exe', '')
    }

    @{
       URL   = 'https://github.com' + $url64
       Version = $version
    }
}

try {
    # Calculate checksum. 
    # Since it is a unified installer, we treat it as 64-bit here to populate $Latest.URL64/Checksum64
    update -ChecksumFor 32
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}
