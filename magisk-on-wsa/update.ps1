import-module au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(folderName\s*=\s*)('.*')"     = "`$1'$($Latest.FolderName64)'"
		}
    }
}


function global:au_BeforeUpdate {
    # checksum calculation based on https://github.com/majkinetor/au/blob/7f9c84e1/AU/Public/Get-RemoteChecksum.ps1
    $fn = [System.IO.Path]::GetTempFileName()
    Invoke-WebRequest $Latest.URL64 -OutFile $fn -UseBasicParsing
    $Latest.Checksum64 = (Get-FileHash $fn -Algorithm sha256 | ForEach-Object Hash).ToLower()

    # Get the name of the archive's root folder
    $Latest.FolderName64 = (7z l -ba $fn).Split('\n')[0].Split(' ')[-1]
    Remove-Item $fn -ea ignore
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "Smart123s" -Repository "MagiskOnWSARemote"

    # Select x64 magisk GApps build
    $url = $download_page.links | ? href -match '.*x64.*with-magisk.*MindTheGapps.*' | % href | select -First 1

    $version = "$( $url -split '_' | select -Last 1 -Skip 2 )"

    @{
       URL64   = 'https://github.com' + $url
       Version = $version
    }
}

try {
    update -ChecksumFor none
} catch {
    $ignore = 'Unable to connect to the remote server'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}

update -ChecksumFor none
