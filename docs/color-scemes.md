# Color-Schemes

We based our main color-scheme  on the very successful "Solarized" theme (https://ethanschoonover.com/solarized/), but changed it a bit.

- we added more background colors so we can color code terminal backgrounds for different servers, clusters, etc ... , all using the same foreground colors.

- we reduced the number of base colors to make room for the fully-saturized `TrafficRed`, `TrafficAmber` and `TrafficGreen` colors.  We really want to have some colors that pop when indicating an "Error", "Warning" or "Success".

- we mappped the Solarized colors on the PowerShell color-names in a bit a different way than other Solarized projects.  We are not really planning to put this in the registry, so it is not important to map the colors on the current defaults of the console applications like Command Prompt, PowerShell, etc...  Instead, we tried to map them in a way we can remember when writing code - although there are a couple of cases where that is not really successful

  - we mapped screen-background color on `Black`, the screen-text color on `Gray` (a.k.a. `DarkWhite`), the popup-background color on `White` and the popup-text color on `DarkGray` (a.k.a. `LightBlack`)
  - we mapped the bright-screen-text color for highlighting on `Cyan`
  - we mapped most of the accent colors on the corresponding `Dark` colors, and the traffic colors on the corresponding `Light` colors (`TrafficAmber` -> `Yellow`).
  - The exceptions to these "memorable" mappings are the colors from the RYB color-wheel.
  
    - `Orange` is mapped on the `Blue` Powershell name.  Remark that `Orange` is the RYB-complement of `Blue`.
    - `Violet` is mapped on the `Magenta` Powershell name.  This is kind of the wrong way around: `Magenta` is mapped on `DarkMagenta`, `Violet` - a kind of dark magenta - is mapped on `Magenta`.

- we added a number of alternative background colors - both in the dark and the light variant.  We rotated the `Hue` 30 degrees for each, and used same `Saturation` and lightness `Value`.

<br/>

### Background Colors

Name               | Solarized Dark | RGB                        | HSV
:------------------|:---------|:---------------------------------|:---
`ScreenBackground` | `base03` | `#002b36` &emsp; (0, 43, 54)     | (192, 100%, 21%)
`PopupBackground`  | `base3`  | `#fdf6e3` &emsp; (253, 246, 227) | (44, 10%, 99%)

Name               | Solarized Light | RGB                       | HSV
:------------------|:---------|:---------------------------------|:---
`ScreenBackground` | `base3`  | `#fdf6e3` &emsp; (253, 246, 227) | (44, 10%, 99%)
`PopupBackground`  | `base03` | `#002b36` &emsp; (0, 43, 54)     | (193, 100%, 21%)

<br/>

### Text Colors

Name                           | Solarized Dark | RGB                        | HSV
:------------------------------|:---------|:---------------------------------|:---
`DimScreenText` (=`PopupText`) | `base00` | `#657b83` &emsp; (101, 123, 131) | (196, 23%, 51%)
`ScreenText` (=`DimPopupText`) | `base0`  | `#839496` &emsp; (131, 148, 150) | (186, 13%, 59%)
`BrightScreenText`             | `base2`  | `#eee8d5` &emsp; (238, 232, 213) | (46, 11%, 93%)
`PopupText` (=`DimScreenText`) | `base0`  | `#839496` &emsp; (131, 148, 150) | (186, 13%, 59%)
`DimPopupText` (=`ScreenText`) | `base00` | `#657b83` &emsp; (101, 123, 131) | (195, 23%, 51%)

Name                           | Solarized Light | RGB                       | HSV
:------------------------------|:---------|:---------------------------------|:---
`DimScreenText` (=`PopupText`) | `base0`  | `#839496` &emsp; (131, 148, 150) | (186, 13%, 59%)
`ScreenText` (=`DimPopupText`) | `base00` | `#657b83` &emsp; (101, 123, 131) | (195, 23%, 51%)
`BrightScreenText`             | `base02` | `#073642` &emsp; (7, 54, 66)     | (192, 89%, 26%)
`PopupText` (=`DimScreenText`) | `base00` | `#657b83` &emsp; (101, 123, 131) | (195, 23%, 51%)
`DimPopupText` (=`ScreenText`) | `base0`  | `#839496` &emsp; (131, 148, 150) | (186, 13%, 59%)

<br/>

### Alternative Background Colors

Dark Backgrounds       | Popup               | RGB                          | HSV
:----------------------|:------------------- |:-----------------------------|:---
`Rainbow Dark-Red`     | `Light-Azure`       | `#360b00` &emsp; (54, 11, 0) | (12, 100%, 21%)
`Rainbow Dark-Yellow`  | `Light-Violet`      | `#2b3600` &emsp; (43, 54, 0) | (72, 100%, 21%)
`Rainbow Dark-Green`   | `Light-Rose`        | `#00360b` &emsp; (0, 54, 11) | (132, 100%, 21%)
`Rainbow Dark-Cyan`    | `Light-Orange`      | `#002b36` &emsp; (0, 43, 54) | (192, 100%, 21%)
`Rainbow Dark-Blue`    | `Light-Chartreuse`  | `#0B0036` &emsp; (11, 0, 54) | (252, 100%, 21%)
`Rainbow Dark-Magenta` | `Light-SpringGreen` | `#36002B` &emsp; (54, 0, 43) | (312, 100%, 21%)

- `Rainbow Dark-Blue` is based on Solarized Dark


Light Backgrounds           | Popup          | RGB                              | HSV
:---------------------------|:---------------|:---------------------------------|:---
`Rainbow Light-Orange`      | `Dark-Cyan`    | `#fdf6e3` &emsp; (253, 246, 227) | (44, 10%, 99%)
`Rainbow Light-Chartreuse`  | `Dark-Blue`    | `#eafde3` &emsp; (234, 253, 227) | (104, 10%, 99%)
`Rainbow Light-SpringGreen` | `Dark-Magenta` | `#e3fdf6` &emsp; (227, 253, 246) | (164, 10%, 99%)
`Rainbow Light-Azure`       | `Dark-Red`     | `#e3eafd` &emsp; (227, 234, 253) | (224, 10%, 99%)
`Rainbow Light-Violet`      | `Dark-Yellow`  | `#f6e3fd` &emsp; (246, 227, 253) | (284, 10%, 99%)
`Rainbow Light-Rose`        | `Dark-Green`   | `#fde3ea` &emsp; (253, 227, 234) | (344, 10%, 99%)

- `Rainbow Light-Orange` is based on Solarized Light


More Backgrounds    | Popup               | RGB                              | HSV
:-------------------|:--------------------|:---------------------------------|:---
`Powershell-Blue`   | `Powershell-White`  | `#001636` &emsp; (0, 22, 54)     | (215, 99%, 34%)
`Powershell-White`  | `Powershell-Blue`   | `#eeedf0` &emsp; (238, 237, 240) | (260, 1%, 94%)

- `Powershell-Blue` is the standard PowerShell console background.
- `Powershell-White` is the standard Powershell console foreground.

 BrightText for Backgrounds | RGB                              | HSV
:---------------------------|:---------------------------------|:---
`Rainbow Dark-Red`          | `#d5dbee` &emsp; (213, 219, 238) | (225, 10%, 93%)
`Rainbow Dark-Yellow`       | `#e8d5ee` &emsp; (232, 213, 238) | (285, 10%, 93%)
`Rainbow Dark-Green`        | `#eed5db` &emsp; (238, 213, 219) | (345, 10%, 93%)
`Rainbow Dark-Cyan`         | `#eee8d5` &emsp; (238, 232, 213) | (45, 10%, 93%)
`Rainbow Dark-Blue`         | `#dbeed5` &emsp; (219, 238, 213) | (105, 10%, 93%)
`Rainbow Dark-Magenta`      | `#d5eee8` &emsp; (213, 238, 232) | (165, 10%, 93%)
`Rainbow Light-Orange`      | `#073642` &emsp; (7, 54, 66)     | (192, 90%, 26%)
`Rainbow Light-Chartreuse`  | `#130742` &emsp; (19, 7, 66)     | (252, 90%, 26%)
`Rainbow Light-SpringGreen` | `#420736` &emsp; (66, 7, 54)     | (312, 90%, 26%)
`Rainbow Light-Azure`       | `#421307` &emsp; (66, 19, 7)     | (12, 90%, 26%)
`Rainbow Light-Violet`      | `#364207` &emsp; (54, 66, 7)     | (72, 90%, 26%)
`Rainbow Light-Rose`        | `#074213` &emsp; (7, 66, 19)     | (132, 90%, 26%)
`Powershell-Blue`           | `#eeedf0` &emsp; (238, 237, 240) | (260, 1%, 94%)
`Powershell-White`          | `#001636` &emsp; (0, 22, 54)     | (215, 99%, 34%)

<br/>

### Accent Colors

Name             | RGB                              | HSV
:----------------|:---------------------------------|:---
`Red`            | `#dc322f` &emsp; (220, 50, 47)   | (1, 79%, 86%)
`Orange`         | `#cb4b16` &emsp; (203, 75, 22)   | (18, 89%, 80%)
`Yellow`         | `#b58900` &emsp; (181, 137, 0)   | (45, 100%, 71%)
`Green`          | `#859900` &emsp; (133, 153, 0)   | (68, 100%, 60%)
`Cyan`           | `#2aa198` &emsp; (42, 161, 152)  | (175, 74%, 63%)
`Blue`           | `#268bd2` &emsp; (38, 139, 210)  | (205, 82%, 82%)
`Violet`         | `#6c71c4` &emsp; (108, 113, 196) | (237, 45%, 77%)
`Magenta`        | `#d33682` &emsp; (211, 54, 130)  | (331, 74%, 83%)

<br/>

### Traffic Colors

Name             | RGB                           | HSV
:----------------|:------------------------------|:---
`TrafficRed`     | `#ff0000` &emsp; (255, 0, 0)  | (0, 100%, 100%)
`TrafficAmber`   | `#ffbf00` &emsp; (255, 191,0) | (45, 100%, 100%)
`TrafficGreen`   | `#00ff00` &emsp; (0, 255, 0)  | (120, 100%, 100%)

<br/>

### More Colors

The following are definitions for the colors of other sources.  These can be used but they are not mapped on the 16 base colors, so one needs to use the RGB-hex code or find a corresponding VT100 code that is close to it.

Name             | RGB                            | HSV
:----------------|:-------------------------------|:---
`RGBRed`         | `#ff0000` &emsp; (255, 0, 0)   | (0, 100%, 100%)
`RGBOrange`      | `#ff8000` &emsp; (255, 128, 0) | (30, 100%, 100%)
`RGBYellow`      | `#ffff00` &emsp; (255, 255, 0) | (60, 100%, 100%)
`RGBChartreuse`  | `#80ff00` &emsp; (128, 255, 0) | (90, 100%, 100%)
`RGBGreen`       | `#00ff00` &emsp; (0, 255, 0)   | (120, 100%, 100%)
`RGBSpringGreen` | `#00ff80` &emsp; (0, 255, 128) | (150, 100%, 100%)
`RGBCyan`        | `#00ffff` &emsp; (0, 255, 255) | (180, 100%, 100%)
`RGBAzure`       | `#0080ff` &emsp; (0, 128, 255) | (210, 100%, 100%)
`RGBBlue`        | `#0000ff` &emsp; (0, 0, 255)   | (240, 100%, 100%)
`RGBViolet`      | `#8000ff` &emsp; (128, 0, 255) | (270, 100%, 100%)
`RGBMagenta`     | `#ff00ff` &emsp; (255, 0, 255) | (300, 100%, 100%)
`RGBRose`        | `#ff0080` &emsp; (255, 0, 128) | (330, 100%, 100%)

Name             | RGB                             | HSV
:----------------|:--------------------------------|:---
`RYBRed`         | `#ff0000` &emsp; (255, 0, 0)    | (0, 100%, 100%)
`RYBVermilion`   | `#ff4000` &emsp; (255, 64, 0)   | (15, 100%, 100%)
`RYBOrange`      | `#ff8000` &emsp; (255, 128, 0)  | (30, 100%, 100%)
`RYBAmber`       | `#ffbf00` &emsp; (255, 191, 0)  | (45, 100%, 100%)
`RYBYellow`      | `#ffff00` &emsp; (255, 255, 0)  | (60, 100%, 100%)
`RYBChartreuse`  | `#81d41a` &emsp; (129, 212, 26) | (87, 88%, 83%)
`RYBGreen`       | `#00a933` &emsp; (0, 169, 51)   | (138, 100%, 66%)
`RYBTeal`        | `#158466` &emsp; (21, 132, 102) | (163, 84%, 52%)
`RYBBlue`        | `#2a6099` &emsp; (42, 96, 153)  | (210, 73%, 60%)
`RYBViolet`      | `#55308d` &emsp; (85, 48, 141)  | (264, 66%, 55%)
`RYBPurple`      | `#800080` &emsp; (128, 0, 128)  | (300, 100%, 50%)
`RYBMagenta`     | `#bf0041` &emsp; (191, 0, 65)   | (340, 100%, 75%)

<br/>

### Mapping the color-scheme names to/from other color-systems

 Color-Scheme Name            | ColorTable     | PowerShell Name | ANSI VT100  Foreground / Background
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

ColorTable     | PowerShell Name           | Color-Scheme Name
---------------|---------------------------|:-----------------
`ColorTable00` | `Black`                   | `ScreenBackground`
`ColorTable01` | `DarkBlue`                | `Blue`
`ColorTable02` | `DarkGreen`               | `Green`
`ColorTable03` | `DarkCyan`                | `Cyan`
`ColorTable04` | `DarkRed`                 | `Red`
`ColorTable05` | `DarkMagenta`             | `Magenta`
`ColorTable06` | `DarkYellow`              | `Yellow`
`ColorTable07` | `Gray` (`DarkWhite`)      | `ScreenText` & `DimPopupText`
`ColorTable08` | `DarkGray` (`LightBlack`) | `PopupText` & `DimScreenText`
`ColorTable09` | `Blue`                    | `Orange`
`ColorTable10` | `Green`                   | `TrafficGreen`
`ColorTable11` | `Cyan`                    | `BrightScreenText`
`ColorTable12` | `Red`                     | `TrafficRed`
`ColorTable13` | `Magenta`                 | `Violet`
`ColorTable14` | `Yellow`                  | `TrafficAmber`
`ColorTable15` | `White`                   | `PopupBackground`

<br/>

ANSI VT100 Foreground / Background | Color-Scheme Name
---------------------|:-----------------
`$e[30m` / `$e[40m`  | `ScreenBackground`
`$e[31m` / `$e[41m`  | `Red`
`$e[32m` / `$e[42m`  | `Green`
`$e[33m` / `$e[43m`  | `Yellow`
`$e[34m` / `$e[44m`  | `Blue`
`$e[35m` / `$e[45m`  | `Magenta`
`$e[36m` / `$e[46m`  | `Cyan`
`$e[37m` / `$e[47m`  | `ScreenText` & `DimPopupText`
`$e[90m` / `$e[100m` | `PopupText` & `DimScreenText`
`$e[91m` / `$e[101m` | `TrafficRed`
`$e[92m` / `$e[102m` | `TrafficGreen`
`$e[93m` / `$e[103m` | `TrafficAmber`
`$e[94m` / `$e[104m` | `Orange`
`$e[95m` / `$e[105m` | `Violet`
`$e[96m` / `$e[106m` | `BrightScreenText`
`$e[97m` / `$e[107m` | `PopupBackground`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`