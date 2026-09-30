$ErrorActionPreference = 'Stop'

if (![Environment]::Is64BitOperatingSystem) {
    throw 'ipatool requires 64-bit Windows (x64).'
}
