$ErrorActionPreference = 'Stop'

Import-Module chocolatey-au

function global:au_SearchReplace {
    @{
        '.\tools\VERIFICATION.txt' = @{
            '(?i)(Download:).*' = "`${1} $($Latest.URL32)"
            '(?i)(SHA256:).*'   = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_GetLatest {
    $page = Invoke-WebRequest `
        -Uri 'https://sourceforge.net/projects/gusek/files/gusek/' `
        -UseBasicParsing

    # Read release directory links, not the stale changelog on the home page.
    # Use numeric version ordering: 0.2.100 must sort after 0.2.24.
    $versionPattern = '/projects/gusek/files/gusek/(?<version>\d+\.\d+\.\d+(?:\.\d+)?)/?$'
    $versions = @(
        $page.Links | ForEach-Object {
            $match = [regex]::Match([string]$_.href, $versionPattern)
            if ($match.Success) {
                [version]$match.Groups['version'].Value
            }
        } | Sort-Object -Descending -Unique
    )

    if ($versions.Count -eq 0) {
        throw 'No GUSEK release directories found. Check the SourceForge page or its markup.'
    }

    $version = $versions[0].ToString()
    $fileName = 'gusek_{0}.zip' -f $version.Replace('.', '-')
    @{
        Version  = $version
        URL32    = "https://downloads.sourceforge.net/project/gusek/gusek/$version/$fileName"
        FileType = 'zip'
    }
}

function global:au_BeforeUpdate {
    $Latest.FileType = 'zip'
    $Latest.Options = @{ Headers = @{ 'User-Agent' = 'curl/8.0' } }
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase 'gusek'

    $zipPath = Join-Path (Resolve-Path '.\tools') 'gusek.zip'
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        $applications = @($archive.Entries | Where-Object { $_.Name -ieq 'gusek.exe' })
        if ($applications.Count -ne 1) {
            throw 'The downloaded ZIP does not contain exactly one gusek.exe.'
        }
    } finally {
        $archive.Dispose()
    }
}

# AU expects to run from the package directory, including when invoked by
# update_all.ps1. Resolve it here so direct invocation from elsewhere also works.
Push-Location $PSScriptRoot
try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' } else { throw $_ }
} finally {
    Pop-Location
}
