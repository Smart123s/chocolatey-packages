Import-Module chocolatey-au

. $PSScriptRoot\..\geekbench6\update.ps1

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

if ($MyInvocation.InvocationName -ne '.') {
    Update-Package -ChecksumFor none
}