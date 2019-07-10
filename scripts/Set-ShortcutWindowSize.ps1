param(
    [Parameter(Mandatory=$true, Position=0)][string]$Path,
    [Parameter(Position=1)][int]$Width = 120,
    [Parameter(Position=2)][int]$Heigth = 50
)

$ErrorActionPreference = 'Stop'

if ( -not ( $Path -match "^.*(\.lnk)$" ) ) {
    $Path = "$Path`.lnk"
}

$lnk = Get-Shortcut.ps1 $Path

$lnk.SetWindowSize($Width, $Height)

$lnk.Save()