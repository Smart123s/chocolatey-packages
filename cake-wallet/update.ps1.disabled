import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "cake-tech" -Repository "cake_wallet"

    # Cake_Wallet_v5.5.0_Windows.exe 
    $url64 = $download_page.links | ? href -match 'Cake_Wallet_.*_Windows\.exe$' | select -First 1 -ExpandProperty href
    $version = ($url64 -split '_' | select -Last 1 -Skip 1).Replace('v','')

    @{
       URL64   = 'https://github.com' + $url64
       Version = $version
    }
}

try {
    update -ChecksumFor 64
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}