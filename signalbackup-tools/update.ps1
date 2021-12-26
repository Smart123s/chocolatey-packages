import-module au

$releases = 'https://github.com/bepaald/signalbackup-tools/releases'

function global:au_SearchReplace {
    # Save program in the Wayback Machine
    # Because the author keeps only the latest version of the software available on Github
    $Headers = @{
        Accept = "application/json"
        Authorization = "LOW $($env:ia_key)"
    }

    # Sned archival request
    Write-Host "Saving in URL Internet Archive: $archive"
    $save = Invoke-RestMethod -Method 'Post' -Uri "https://web.archive.org/save" -Body @{url=$Latest.URL64} -Headers $Headers
    $job_id = $save.job_id

    Write-Host "Save Page Now job_id: $job_id"

    Do {
        $status = Invoke-RestMethod -Method 'Post' -Uri "https://web.archive.org/save/status" -Body @{job_id="$($job_id)"} -Headers $Headers
    } While ($status.status –eq 'pending')
    
    if ($status.status -eq 'success') {
        $archive = "https://web.archive.org/web/$($status.timestamp)/$($status.original_url)"
    } else {
        throw "Failed to archive URL \n $status"
    }

    @{
        ".\tools\VERIFICATION.txt" = @{
          "(?i)(Download:).*"   = "`${1} $($Latest.URL64)"
          "(?i)(Archived:).*"   = "`${1} $($archive)"
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