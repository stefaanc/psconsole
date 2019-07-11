$ErrorActionPreference = 'Stop'

if ( -not ( Test-Path -Path "$ROOT/playground") ) {
    New-Item -ItemType 'directory' "$ROOT/playground"
}

#$command = "function global:Prompt { Write-Host -NoNewline `'PS >`'; return `' `' }; $ROOT/scripts/Write-ColorizedColors;"
$command = "$ROOT/scripts/Write-ColorizedColors;"

New-Shortcut "$ROOT/playground/colorized-light-springgreen" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-springgreen" -Theme "$ROOT/colors/console-colorized-light-springgreen.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-springgreen" -Width 40 -Height 43 -BufferHeight 43

New-Shortcut "$ROOT/playground/powershell-dark" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/powershell-dark" -Theme "$ROOT/colors/console-powershell-dark.json"
Set-ShortcutWindowSize "$ROOT/playground/powershell-dark" -Width 40 -Height 43 -BufferHeight 43


New-Shortcut "$ROOT/playground/test" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
Set-ShortcutColors "$ROOT/playground/test" -Theme "$ROOT/colors/console-powershell-dark.json"
