Set-Variable HOME "$env:USERPROFILE" -Scope Global -Force
( Get-PSProvider 'FileSystem' ).Home = $HOME   # replace "~"

$ROOT = "$HOME\Projects\psconsole"
$PATH = "$ROOT\scripts;$env:PATH"

$env:HOME = $HOME
$env:ROOT = $ROOT
$env:PATH = $PATH

if ( -not ( Get-Location ).Path.StartsWith("$ROOT") ) {
    Set-Location "$ROOT"
}

. Apply-PSConsoleSettings "PSCONSOLE"
