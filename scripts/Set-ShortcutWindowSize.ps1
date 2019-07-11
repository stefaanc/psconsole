param(
    [Parameter(Mandatory=$true, Position=0)][string]$Path,
    [Parameter(Position=1)][Alias("Width")][int]$X = 120,
    [Parameter(Position=2)][Alias("Height")][int]$Y = 50,
    [Parameter(Position=4)][Alias("BufferHeight")][int]$BufferY = 8000
)

$ErrorActionPreference = 'Stop'

if ( -not ( $Path -match "^.*(\.lnk)$" ) ) {
    $Path = "$Path`.lnk"
}

$lnk = Get-Shortcut.ps1 $Path

$lnk.SetScreenBufferSize($X, $BufferY)
$lnk.SetWindowSize($X, $Y)

$lnk.Save()