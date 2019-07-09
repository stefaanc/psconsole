param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path $_})]
    [string]$Path,

    [Parameter()]
    [ValidateScript({Test-Path $_})]
    [string]$Theme
)

$ErrorActionPreference = 'Stop'

$lnk = & .\Get-Shortcut.ps1 $Path
$colors = $( Get-Content -Raw -Path "$Theme" | ConvertFrom-Json )

$lnk.ScreenTextColor = $colors.console.ScreenTextColor
$lnk.ScreenBackgroundColor = $colors.console.ScreenBackgroundColor
$lnk.PopUpTextColor = $colors.console.PopUpTextColor
$lnk.PopUpBackgroundColor = $colors.console.PopUpBackgroundColor

$lnk.ConsoleColors[0] = $colors.console.ConsoleColors[0]
$lnk.ConsoleColors[1] = $colors.console.ConsoleColors[1]
$lnk.ConsoleColors[2] = $colors.console.ConsoleColors[2]
$lnk.ConsoleColors[3] = $colors.console.ConsoleColors[3]
$lnk.ConsoleColors[4] = $colors.console.ConsoleColors[4]
$lnk.ConsoleColors[5] = $colors.console.ConsoleColors[5]
$lnk.ConsoleColors[6] = $colors.console.ConsoleColors[6]
$lnk.ConsoleColors[7] = $colors.console.ConsoleColors[7]
$lnk.ConsoleColors[8] = $colors.console.ConsoleColors[8]
$lnk.ConsoleColors[9] = $colors.console.ConsoleColors[9]
$lnk.ConsoleColors[10] = $colors.console.ConsoleColors[10]
$lnk.ConsoleColors[11] = $colors.console.ConsoleColors[11]
$lnk.ConsoleColors[12] = $colors.console.ConsoleColors[12]
$lnk.ConsoleColors[13] = $colors.console.ConsoleColors[13]
$lnk.ConsoleColors[14] = $colors.console.ConsoleColors[14]
$lnk.ConsoleColors[15] = $colors.console.ConsoleColors[15]

$lnk.Save()

Write-Output "Updated colors for $Path to $Theme"
