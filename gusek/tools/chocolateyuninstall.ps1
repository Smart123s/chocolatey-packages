$ErrorActionPreference = 'Stop'

$shortcutFolders = @(
    [Environment]::GetFolderPath('CommonPrograms')
    [Environment]::GetFolderPath('DesktopDirectory')
)

foreach ($folder in $shortcutFolders) {
    if (-not [string]::IsNullOrWhiteSpace($folder)) {
        $shortcutPath = Join-Path $folder 'GUSEK.lnk'
        if (Test-Path -LiteralPath $shortcutPath -PathType Leaf) {
            Remove-Item -LiteralPath $shortcutPath -Force
        }
    }
}
