$ErrorActionPreference = 'Stop'

if ( -not ( Test-Path -Path "$ROOT/playground") ) {
    New-Item -ItemType 'directory' "$ROOT/playground"
}

New-Shortcut "$ROOT/playground/powershell-dark" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit $ROOT/scripts/Write-ColorizedColors"
Set-ShortcutColors "$ROOT/playground/powershell-dark" -Theme "$ROOT/colors/console-powershell-dark.json"
Set-ShortcutWindowSize "$ROOT/playground/powershell-dark" 29 42