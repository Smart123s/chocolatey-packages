$ErrorActionPreference = 'Stop'
Import-Module chocolatey-au
Import-Module wormies-au-helpers
. (Join-Path $PSScriptRoot '..\_scripts\Get-GitHubLatestReleaseLinks.ps1')

function global:au_SearchReplace {
    @{
        '.\tools\VERIFICATION.txt' = @{
            '(?i)(Download:).*'       = "`${1} $($Latest.URL64)"
            '(?i)(Archive sha256:).*' = "`${1} $($Latest.Checksum64)"
            '(?i)(Binary sha256:).*'  = "`${1} $($Latest.BinaryChecksum64)"
            '(?i)(Extract:).*'        = "`${1} bin/ipatool-$($Latest.UpstreamVersion)-windows-amd64.exe"
        }
    }
}

function global:au_BeforeUpdate {
    $toolsPath = Join-Path $PSScriptRoot 'tools'
    $archivePath = Join-Path $toolsPath 'ipatool.tar.gz'
    $binaryName = "ipatool-$($Latest.UpstreamVersion)-windows-amd64.exe"
    $extractedPath = Join-Path $toolsPath $binaryName
    $client = New-Object System.Net.WebClient

    try {
        $Latest.FileType = 'tar.gz'
        Get-RemoteFiles -Purge -NoSuffix -FileNameBase 'ipatool'

        $checksum = $client.DownloadString($Latest.URL64 + '.sha256sum').Trim()
        if ($checksum -notmatch '^(?<hash>[a-fA-F0-9]{64})(?:\s+.*)?$') {
            throw 'The upstream SHA256 checksum has an unexpected format.'
        }
        if ($Latest.Checksum64 -ne $Matches['hash']) {
            throw 'The ipatool archive does not match the upstream SHA256 checksum.'
        }

        # Extract while updating so the Chocolatey package contains the executable itself.
        & tar -xzf $archivePath -C $toolsPath --strip-components 1 "bin/$binaryName"
        if ($LASTEXITCODE -ne 0 -or !(Test-Path -LiteralPath $extractedPath)) {
            throw 'Failed to extract the Windows x64 ipatool executable.'
        }
        Move-Item -LiteralPath $extractedPath -Destination (Join-Path $toolsPath 'ipatool.exe') -Force
        $Latest.BinaryChecksum64 = (Get-FileHash -LiteralPath (Join-Path $toolsPath 'ipatool.exe') -Algorithm SHA256).Hash

    } finally {
        $client.Dispose()
        if (Test-Path -LiteralPath $archivePath) { Remove-Item -LiteralPath $archivePath -Force }
        if (Test-Path -LiteralPath $extractedPath) { Remove-Item -LiteralPath $extractedPath -Force }
    }
}

function global:au_GetLatest {
    $downloadPage = Get-GitHubLatestReleaseLinks -User 'majd' -Repository 'ipatool'
    $url = $downloadPage.links | Where-Object href -match '/ipatool-[\d.]+-windows-amd64\.tar\.gz$' |
        Select-Object -First 1 -ExpandProperty href

    if (!$url -or $url -notmatch '/download/v(?<version>\d+\.\d+\.\d+)/') {
        throw 'Could not find a stable Windows x64 ipatool release.'
    }
    $version = $Matches['version']

    @{
        URL64 = ([Uri]::new([Uri]'https://github.com', $url)).AbsoluteUri
        Version = $version
        UpstreamVersion = $version
    }
}

try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' } else { throw $_ }
}
