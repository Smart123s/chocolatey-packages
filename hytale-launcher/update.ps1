Import-Module AU

# The webpage doesn't mention the version of the file, so it has to be downloaded to check it
$releases = 'https://launcher.hytale.com/builds/release/windows/amd64/hytale-launcher-installer-latest.exe'

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

    $rawVersion = (Get-Item $tempfile).VersionInfo.FileVersion

    # SANITIZATION:
    # 1. Split by the hyphen '-' and take the first part (the date).
    # 2. Trim any extra spaces just in case.
    $version = $rawVersion.Split('-')[0].Trim()

    $checksum = (Get-FileHash $tempfile).Hash

    Remove-Item $tempfile
	
    return @{ Version = $version ; Checksum64 = $checksum }
}

Update-Package -ChecksumFor none
