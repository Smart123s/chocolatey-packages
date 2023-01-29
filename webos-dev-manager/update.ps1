import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "webosbrew" -Repository "dev-manager-desktop" -AbsoluteLatestRelease

    $url32 = $download_page.links | ? href -match '.*x86.*.msi$' | % href | select -First 1
    $url64 = $download_page.links | ? href -match '.*x64.*.msi$' | % href | select -First 1
    $version = ($url64 -split '_' | select -First 1 -Skip 1)

    @{
       URL32   = 'https://github.com' + $url32
       URL64   = 'https://github.com' + $url64
       Version = $version
    }
}

try {
    update -ChecksumFor all
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}