# Color Names

 Color-Scheme Name            | ColorTable     | PowerShell Name | ANSI VT100 Foreground / Background
------------------------------|----------------|---------------|--------------------
`ScreenBackground`            | `ColorTable00` | `Black`       | `$e[30m` / `$e[40m`
`PopupBackground`             | `ColorTable15` | `White`       | `$e[97m` / `$e[107m`
`DimScreenText` & `PopupText` | `ColorTable08` | `DarkGray` (`LightBlack`) | `$e[90m` / `$e[100m`
`ScreenText` & `DimPopupText` | `ColorTable07` | `Gray` (`DarkWhite`)      | `$e[37m` / `$e[47m`
`BrightScreenText`            | `ColorTable11` | `Cyan`        | `$e[96m` / `$e[106m`
`Red`                         | `ColorTable04` | `DarkRed`     | `$e[31m` / `$e[41m`
`Orange`                      | `ColorTable09` | `Blue`        | `$e[94m` / `$e[104m`
`Yellow`                      | `ColorTable06` | `DarkYellow`  | `$e[33m` / `$e[43m`
`Green`                       | `ColorTable02` | `DarkGreen`   | `$e[32m` / `$e[42m`
`Cyan`                        | `ColorTable03` | `DarkCyan`    | `$e[36m` / `$e[46m`
`Blue`                        | `ColorTable01` | `DarkBlue`    | `$e[34m` / `$e[44m`
`Violet`                      | `ColorTable13` | `Magenta`     | `$e[95m` / `$e[105m`
`Magenta`                     | `ColorTable05` | `DarkMagenta` | `$e[35m` / `$e[45m`
`TrafficRed`                  | `ColorTable12` | `Red`         | `$e[91m` / `$e[101m`
`TrafficAmber`                | `ColorTable14` | `Yellow`      | `$e[93m` / `$e[103m`
`TrafficGreen`                | `ColorTable10` | `Green`       | `$e[92m` / `$e[102m`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`

<br/>

ColorTable     | PowerShell Name           | Color-Scheme Name             | ANSI VT100 Foreground / Background
---------------|---------------|-------------------------------|--------------------
`ColorTable00` | `Black`       | `ScreenBackground`            | `$e[30m` / `$e[40m`
`ColorTable01` | `DarkBlue`    | `Blue`                        | `$e[34m` / `$e[44m`
`ColorTable02` | `DarkGreen`   | `Green`                       | `$e[32m` / `$e[42m`
`ColorTable03` | `DarkCyan`    | `Cyan`                        | `$e[36m` / `$e[46m`
`ColorTable04` | `DarkRed`     | `Red`                         | `$e[31m` / `$e[41m`
`ColorTable05` | `DarkMagenta` | `Magenta`                     | `$e[35m` / `$e[45m`
`ColorTable06` | `DarkYellow`  | `Yellow`                      | `$e[33m` / `$e[43m`
`ColorTable07` | `Gray` (`DarkWhite`)      | `ScreenText` & `DimPopupText` | `$e[37m` / `$e[47m`
`ColorTable08` | `DarkGray` (`LightBlack`) | `PopupText` & `DimScreenText` | `$e[90m` / `$e[100m`
`ColorTable09` | `Blue`        | `Orange`                      | `$e[94m` / `$e[104m`
`ColorTable10` | `Green`       | `TrafficGreen`                | `$e[92m` / `$e[102m`
`ColorTable11` | `Cyan`        | `BrightScreenText`            | `$e[96m` / `$e[106m`
`ColorTable12` | `Red`         | `TrafficRed`                  | `$e[91m` / `$e[101m`
`ColorTable13` | `Magenta`     | `Violet`                      | `$e[95m` / `$e[105m`
`ColorTable14` | `Yellow`      | `TrafficAmber`                | `$e[93m` / `$e[103m`
`ColorTable15` | `White`       | `PopupBackground`             | `$e[97m` / `$e[107m`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`

<br/>

ANSI VT100 Foreground / Background | ColorTable | PowerShell Name | Color-Scheme Name
---------------------| ---------------|---------------|------------------
`$e[30m` / `$e[40m`  | `ColorTable00` | `Black`       | `ScreenBackground`
`$e[31m` / `$e[41m`  | `ColorTable04` | `DarkRed`     | `Red`
`$e[32m` / `$e[42m`  | `ColorTable02` | `DarkGreen`   | `Green`
`$e[33m` / `$e[43m`  | `ColorTable06` | `DarkYellow`  | `Yellow`
`$e[34m` / `$e[44m`  | `ColorTable01` | `DarkBlue`    | `Blue`
`$e[35m` / `$e[45m`  | `ColorTable05` | `DarkMagenta` | `Magenta`
`$e[36m` / `$e[46m`  | `ColorTable03` | `DarkCyan`    | `Cyan`
`$e[37m` / `$e[47m`  | `ColorTable07` | `Gray` (`DarkWhite`)      | `ScreenText` & `DimPopupText`
`$e[90m` / `$e[100m` | `ColorTable08` | `DarkGray` (`LightBlack`) | `PopupText` & `DimScreenText`
`$e[91m` / `$e[101m` | `ColorTable12` | `Red`         | `TrafficRed`
`$e[92m` / `$e[102m` | `ColorTable10` | `Green`       | `TrafficGreen`
`$e[93m` / `$e[103m` | `ColorTable14` | `Yellow`      | `TrafficAmber`
`$e[94m` / `$e[104m` | `ColorTable09` | `Blue`        | `Orange`
`$e[95m` / `$e[105m` | `ColorTable13` | `Magenta`     | `Violet`
`$e[96m` / `$e[106m` | `ColorTable11` | `Cyan`        | `BrightScreenText`
`$e[97m` / `$e[107m` | `ColorTable15` | `White`       | `PopupBackground`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`