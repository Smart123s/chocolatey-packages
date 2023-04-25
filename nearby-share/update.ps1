Import-Module AU

# The webpage doesn't mention the version of the file, so it has to be downloaded to check it
$releases = 'https://installerstorage.blob.core.windows.net/public/install/Tresorit.exe'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
    # Download installer
    # Code inspired by:
    # https://github.com/ferventcoder/chocolatey-packages/blob/3746ec3ac81d3685832398c911fc95b5c9631728/automatic/_output/foobar2000/1.3.6/tools/Get-FilenameFromRegex.ps1
    $tempfile = "$env:TEMP\chocolatey_temp_download.exe"
    $wc = new-object system.net.webclient
    $wc.UseDefaultCredentials = $true
    $wc.downloadfile($releases, $tempfile)

    $version  = (Get-Item $tempfile).VersionInfo.FileVersion
    $checksum = (Get-FileHash $tempfile).Hash

    Remove-Item $tempfile
	
    return @{ Version = $version ; Checksum64 = $checksum }
}

Update-Package -ChecksumFor none