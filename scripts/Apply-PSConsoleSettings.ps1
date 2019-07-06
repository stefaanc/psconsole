#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/psconsole
#
# use:
#
#     Apply-PSConsoleSettings.ps1 "$Project" [ -NoPrompt ]
#
# with:
#
#     $Project is the name to show in the window title.
#
#         for instance $Project = "KLUSTER"
#         will set the window title to "Windows PowerShell for KLUSTER"
#
#         for instance $Project = "" or $null
#         will set the window title to "Windows PowerShell"
#
#     -NoPrompt will not define a function to change the prompt
#
# requires:
#
#     $ROOT/.psconsole.json = {
#         "AdminColorScheme": {...}
#         "UserColorScheme": {...}
#         "DefaultColorScheme": {...}
#     }
#
# default psconsole-settings:
#
#     {
#         "DefaultColorScheme": {
#             "OutputForegroundColor": "DarkYellow",
#             "OutputBackgroundColor": "DarkMagenta",
#             "ErrorForegroundColor": "Red",
#             "ErrorBackgroundColor": "Black",
#             "WarningForegroundColor": "Yellow",
#             "WarningBackgroundColor": "Black",
#             "DebugForegroundColor": "Yellow",
#             "DebugBackgroundColor": "Black",
#             "VerboseForegroundColor": "Yellow",
#             "VerboseBackgroundColor": "Black",
#             "ProgressForegroundColor": "Yellow",
#             "ProgressBackgroundColor": "DarkCyan",
#             "PromptForegroundColor": "DarkYellow",
#             "PromptBackgroundColor": "DarkMagenta"
#         }
#     }
#
#     Remark that changing 'ForegroundColor' and 'BackgroundColor' doesn't persist
#     in late PowerShell 5.1 versions.  This is a bug in PSReadLine that is solved
#     in PowerShell 6 version
#
# colors:
#
#     Black                         # Legacy RGB (0,0,0)       "#000000"
#     DarkBlue                      # Legacy RGB (0,0,128)     "#000080"
#     DarkGreen                     # Legacy RGB (0,128,0)     "#008000"
#     DarkCyan                      # Legacy RGB (0,128,128)   "#008080"
#     DarkRed                       # Legacy RGB (128,0,0)     "#800000"
#     DarkMagenta                   # Legacy RGB (1,36,86)     "#012456" <<< changed for PowerShell, from default (128,0,128) "#800080"
#     DarkYellow                    # Legacy RGB (238,237,240) "#EEEDF0" <<< changed for PowerShell, from default (128,128,0) "#808000"
#     Gray       # i.e. DarkWhite   # Legacy RGB (192,192,192) "#C0C0C0"
#     DarkGray   # i.e. LightBlack  # Legacy RGB (128,128,128) "#808080"
#     Blue                          # Legacy RGB (0,0,255)     "#0000FF"
#     Green                         # Legacy RGB (0,255,0)     "#00FF00"
#     Cyan                          # Legacy RGB (0,255,255)   "#00FFFF"
#     Red                           # Legacy RGB (255,0,0)     "#FF0000"
#     Magenta                       # Legacy RGB (255,0,255)   "#Ff00FF"
#     Yellow                        # Legacy RGB (255,255,0)   "#FFFF00"
#     White                         # Legacy RGB (255,255,255) "#FFFFFF"
#
#     Remark that these colors don't necessarily are in-line with their name.
#     The effective colors are set in the registry and the properties of the shortcut
#     to powershell.exe (ref: .https://devblogs.microsoft.com/commandline/understanding-windows-console-host-settings)
#     The boxes in the shortcut's properties (left-to-right) show the colors
#     corresponding to the above names (top-to-bottom)
#
param(
    [parameter(position=0)]$Project,
    [switch]$NoPrompt
)

if ( $HOST.Name -ne 'ConsoleHost' ) {
    Write-Warning "This only works in the console host, not the ISE."
    return
}

#
# set the colors for streams and tokens
function ApplyPSConsoleSettings {
    # we are using a function to avoid variables polluting the environment when sourcing this

    $e = [char]27

    $VTForegroundColors = @{
        Black = "30"
        DarkBlue = "34"
        DarkGreen = "32"
        DarkCyan = "36"
        DarkRed = "31"
        DarkMagenta = "35"
        DarkYellow = "33"
        Gray = "37"
        DarkGray = "90"
        Blue = "94"
        Green = "92"
        Cyan = "96"
        Red = "91"
        Magenta = "95"
        Yellow = "93"
        White = "97"
    }

    $VTBackgroundColors = @{
        Black = "40"
        DarkBlue = "44"
        DarkGreen = "42"
        DarkCyan = "46"
        DarkRed = "41"
        DarkMagenta = "45"
        DarkYellow = "43"
        Gray = "47"
        DarkGray = "100"
        Blue = "104"
        Green = "102"
        Cyan = "106"
        Red = "101"
        Magenta = "105"
        Yellow = "103"
        White = "107"
    }

    #
    # pickup the console settings and set console title
    $PSConsoleSettings = $( Get-Content -Raw -Path "$ROOT/.psconsole.json" | ConvertFrom-Json )

    $CurrentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $IsAdmin = $CurrentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    if ( $IsAdmin ) {
        $CS = $PSConsoleSettings.AdminColorScheme
    }
    else {
        $CS = $PSConsoleSettings.UserColorScheme
    }
    if ( -not $CS ) {
        $CS = $PSConsoleSettings.DefaultColorScheme
    }

    #
    # set the console title
    if ( "$Project" -ne "" ) {
        $HOST.UI.RawUI.WindowTitle = "Windows PowerShell for $Project"
    }
    else {
        $HOST.UI.RawUI.WindowTitle = "Windows PowerShell"
    }
    if ( $IsAdmin ) {
        $HOST.UI.RawUI.WindowTitle = "[Administrator] $( $HOST.UI.RawUI.WindowTitle )"
    }

    #
    # set the colors for the streams
    if ( $HOST.UI.RawUI.BackgroundColor -ne $CS.OutputBackgroundColor ) {
        $MustClearHost = $true
    }

    $HOST.UI.RawUI.ForegroundColor = $CS.OutputForegroundColor
    $HOST.UI.RawUI.BackgroundColor = $CS.OutputBackgroundColor
    $HOST.PrivateData.ErrorForegroundColor = $CS.ErrorForegroundColor
    $HOST.PrivateData.ErrorBackgroundColor = $CS.ErrorBackgroundColor
    $HOST.PrivateData.WarningForegroundColor = $CS.WarningForegroundColor
    $HOST.PrivateData.WarningBackgroundColor = $CS.WarningBackgroundColor
    $HOST.PrivateData.DebugForegroundColor = $CS.DebugForegroundColor
    $HOST.PrivateData.DebugBackgroundColor = $CS.DebugBackgroundColor
    $HOST.PrivateData.VerboseForegroundColor = $CS.VerboseForegroundColor
    $HOST.PrivateData.VerboseBackgroundColor = $CS.VerboseBackgroundColor
    $HOST.PrivateData.ProgressForegroundColor = $CS.ProgressForegroundColor
    $HOST.PrivateData.ProgressBackgroundColor = $CS.ProgressBackgroundColor

    #
    # set the colors for the prompt
    $global:PROMPT_FOREGROUNDCOLOR = $CS.PromptForegroundColor
    $global:PROMPT_BACKGROUNDCOLOR = $CS.PromptBackgroundColor

    if ( $IsAdmin ) {
        $global:PROMPT_ADMIN_FOREGROUNDCOLOR = $CS.WarningForegroundColor
        $global:PROMPT_ADMIN_BACKGROUNDCOLOR = $CS.WarningBackgroundColor
    }
    else {
        $global:PROMPT_ADMIN_FOREGROUNDCOLOR = $null
        $global:PROMPT_ADMIN_BACKGROUNDCOLOR = $null
    }

    #
    # set the colors for the syntax-highlighting
    if ( $PSVERSIONTABLE.PSVersion.Major -ge 5 ) {
        # '$PSReadlineOptions' was introduced in PowerShell version 5

        $Current = Get-PSReadLineOption
        if ( "$current.CommandColor" -ne "" ) {
            # the color properties changed from late PowerShell 5.1 versions onward

            #
            # change the background colors to the 'OutputBackgroundColor'
            $PSReadlineOptions = @{
                Colors = @{
                    Command = $Current.CommandColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Comment = $Current.CommentColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    ContinuationPrompt = $Current.ContinuationPromptColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Default = $Current.DefaultTokenColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Emphasis = $Current.EmphasisColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Error = $Current.ErrorColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Keyword = $Current.KeywordColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Member = $Current.MemberColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Number = $Current.NumberColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Operator = $Current.OperatorColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Parameter = $Current.ParameterColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    #Selection     # the selection color typically has a background that's different from the others => we don't touch it
                    String = $Current.StringColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Type = $Current.TypeColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                    Variable = $Current.VariableColor -replace ';[0-9]*m', 'm' -replace 'm', ";$( $VTBackgroundColors.$( $CS.OutputBackgroundColor ) )m"
                }
            }
            Set-PSReadlineOption @PSReadlineOptions
        }
    }

    #
    # clear host when UI background color changed
    if ( $MustClearHost ) {
        Clear-Host
    }
}
ApplyPSConsoleSettings

#
# set the colors for the prompt
if ( -not $NoPrompt ) {
    function $global:Prompt {
        if ( "$PROMPT_ADMIN_FOREGROUNDCOLOR" -ne "" ) {
            Write-Host "[Administrator] " -NoNewline -ForegroundColor $PROMPT_ADMIN_FOREGROUNDCOLOR -BackgroundColor $PROMPT_ADMIN_BACKGROUNDCOLOR
        }
        Write-Host "PS $( Get-Location )>" -NoNewline -ForegroundColor $PROMPT_FOREGROUNDCOLOR -BackgroundColor $PROMPT_BACKGROUNDCOLOR

        return " "
    }
}

exit 0
