Import-Module AU

$releases = 'https://www.geekbench.com/download/windows/'

function global:au_SearchReplace {
    $majorVersion = $($Latest.Version).Split('.') | select -First 1
    # https://github.com/joachimschmidt557/chocolatey-packages-manual-automatic/blob/e89eed2fa0800092ca395a816b7c98280b7e0d9a/automatic/youtube-dl-gui/update.ps1
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName)$majorVersion`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

function global:au_BeforeUpdate {
    # Do not download installer
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $regex         = '.*-WindowsSetup.exe'
    $url           = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $version       = ($url -split '-' | select -Skip 1 -Last 1)
	
    if (-not $version.StartsWith('6')) {
        throw 'New major version has been released. Aborting update.'
    }

    return @{ Version = $version; URL64 = $url }
}

Update-Package -ChecksumFor none