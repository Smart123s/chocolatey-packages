Import-Module chocolatey-au

$releases = 'https://www.primatelabs.com/release/geekbench7/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $baseVersion = [version]'7.0.0'
    try {
        $nuspecPath = (Resolve-Path "$PSScriptRoot\*.nuspec" -ErrorAction SilentlyContinue).Path
        if ($nuspecPath) {
            $nuspec = [xml](Get-Content $nuspecPath)
            $baseVersion = [version]$nuspec.package.metadata.version
        }
    } catch { }

    try {
        $page = (Invoke-WebRequest -Uri $releases -UseBasicParsing -TimeoutSec 10).Content
        $matches = [regex]::Matches($page, '(?i)<h2[^>]*>Geekbench\s+([0-9\.]+)</h2>')
        $pageVersions = $matches | ForEach-Object { [version]$_.Groups[1].Value } | Where-Object { $_.Major -eq 7 } | Sort-Object -Descending
        if ($pageVersions -and $pageVersions[0] -gt $baseVersion) {
            $baseVersion = $pageVersions[0]
        }
    } catch {
        Write-Warning "Could not fetch release notes page: $_"
    }

    $current = $baseVersion
    $foundNewer = $true
    while ($foundNewer) {
        $foundNewer = $false

        foreach ($offset in 1..2) {
            $nextPatch = [version]"$($current.Major).$($current.Minor).$($current.Build + $offset)"
            $patchUrl  = "https://cdn.geekbench.com/Geekbench-$nextPatch-WindowsSetup.exe"
            try {
                $res = Invoke-WebRequest -Uri $patchUrl -Method Head -TimeoutSec 3 -UseBasicParsing
                if ($res.StatusCode -eq 200) {
                    $current = $nextPatch
                    $foundNewer = $true
                    break
                }
            } catch { }
        }
        if ($foundNewer) { continue }

        foreach ($offset in 1..2) {
            $nextMinor = [version]"$($current.Major).$($current.Minor + $offset).0"
            $minorUrl  = "https://cdn.geekbench.com/Geekbench-$nextMinor-WindowsSetup.exe"
            try {
                $res = Invoke-WebRequest -Uri $minorUrl -Method Head -TimeoutSec 3 -UseBasicParsing
                if ($res.StatusCode -eq 200) {
                    $current = $nextMinor
                    $foundNewer = $true
                    break
                }
            } catch { }
        }
    }

    $version = $current.ToString()
    if ($current.Major -ne 7) {
        throw 'New major version has been released. Aborting update.'
    }

    $url = "https://cdn.geekbench.com/Geekbench-$version-WindowsSetup.exe"
    return @{ Version = $version; URL64 = $url }
}

if ($MyInvocation.InvocationName -ne '.') {
    Update-Package -ChecksumFor none
}