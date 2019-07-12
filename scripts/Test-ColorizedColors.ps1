#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/psconsole
#

$ErrorActionPreference = 'Stop'

if ( -not ( Test-Path -Path "$ROOT/playground") ) {
    New-Item -ItemType 'directory' "$ROOT/playground"
}

$command = "function global:Prompt { Write-Host -NoNewline `'PS >`'; return `' `' }; $ROOT/scripts/Write-ColorizedColors;"

New-Shortcut "$ROOT/playground/colorized-dark-red" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-dark-red" -Theme "$ROOT/colors/psconsole-colorized-dark-red.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-dark-red" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-dark-yellow" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-dark-yellow" -Theme "$ROOT/colors/psconsole-colorized-dark-yellow.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-dark-yellow" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-dark-green" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-dark-green" -Theme "$ROOT/colors/psconsole-colorized-dark-green.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-dark-green" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-dark-cyan" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-dark-cyan" -Theme "$ROOT/colors/psconsole-colorized-dark-cyan.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-dark-cyan" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-dark-blue" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-dark-blue" -Theme "$ROOT/colors/psconsole-colorized-dark-blue.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-dark-blue" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-dark-magenta" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-dark-magenta" -Theme "$ROOT/colors/psconsole-colorized-dark-magenta.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-dark-magenta" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-light-orange" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-orange" -Theme "$ROOT/colors/psconsole-colorized-light-orange.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-orange" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-light-chartreuse" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-chartreuse" -Theme "$ROOT/colors/psconsole-colorized-light-chartreuse.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-chartreuse" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-light-springgreen" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-springgreen" -Theme "$ROOT/colors/psconsole-colorized-light-springgreen.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-springgreen" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-light-azure" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-azure" -Theme "$ROOT/colors/psconsole-colorized-light-azure.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-azure" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-light-violet" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-violet" -Theme "$ROOT/colors/psconsole-colorized-light-violet.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-violet" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/colorized-light-rose" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/colorized-light-rose" -Theme "$ROOT/colors/psconsole-colorized-light-rose.json"
Set-ShortcutWindowSize "$ROOT/playground/colorized-light-rose" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/powershell-dark" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/powershell-dark" -Theme "$ROOT/colors/psconsole-powershell-dark.json"
Set-ShortcutWindowSize "$ROOT/playground/powershell-dark" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/powershell-light" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/powershell-light" -Theme "$ROOT/colors/psconsole-powershell-light.json"
Set-ShortcutWindowSize "$ROOT/playground/powershell-light" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/powershell-legacy" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/powershell-legacy" -Theme "$ROOT/colors/psconsole-powershell-legacy.json"
Set-ShortcutWindowSize "$ROOT/playground/powershell-legacy" -Width 40 -Height 43 -ScreenBufferHeight 43

New-Shortcut "$ROOT/playground/powershell-campbell" -TargetPath "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe" -Arguments "-NoProfile -NoExit `"$command`""
Set-ShortcutColors "$ROOT/playground/powershell-campbell" -Theme "$ROOT/colors/psconsole-powershell-campbell.json"
Set-ShortcutWindowSize "$ROOT/playground/powershell-campbell" -Width 40 -Height 43 -ScreenBufferHeight 43
