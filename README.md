# PSConsole

**some scripts to work with different Windows PowerShell profiles and to initialize a Windows PowerShell console**

If you are like me, working on a couple of projects (or project versions) at the same time, it is a real hassle to go and change the PowerShell profile settings in `~\Documents\WindowsPowerShell`.  So I needed a better system to do this.

My requirements are:
- When starting PowerShell from anywhere within a project, pick-up the project's profile
- When starting Powershell from outside a project, pick-up a default profile
  - if I defined a default project, the profile for that project
  - if I didn't, a generic profile


Also, it is not really easy to find out how to change the colors for the PowerShell console.  There are an enormous amount of web-pages on this subject, lots of different methods to try.  Different methods for different versions of PowerShell.  I needed to find the best way for me.

My requirements are:
- Changing the colors of the PowerShell console
- Changing the window title for different projects (or project versions)
- Changing the window title and the prompt when running as 'Administrator'
- Changing the window title and the background color when working with different servers, VMs, clusters,...


## Project Profiles

An overview of the profile structure

```text
HOME
  |-- Documents
  |     |-- WindowsPowerShell
  |           |-- profile.ps1             # <<<<<<<<<< master profile
  |           |                           #            (incl. default-master profile)
  |           |-- scripts
  |                 |-- Apply-PSConsoleSettings.ps1
  |
  |-- Projects
        |-- .psprofile.ps1                # <<<<<<<<<< default-project profile
        |
        |-- project-1
        |     |-- .psprofile.ps1          # <<<<<<<<<< project profile
        |     |
        |     |-- scripts
        |           |-- Apply-PSConsoleSettings.ps1
        |
        |-- project-2
        |     |-- .psprofile.ps1          # <<<<<<<<<< project profile
        |     |
        |     |-- scripts
        |           |-- Apply-PSConsoleSettings.ps1
        .
        .
        .
        |-- project-N
              |-- .psprofile.ps1          # <<<<<<<<<< project profile
              |
              |-- scripts
                    |-- Apply-PSConsoleSettings.ps1
```

### The master profile

You can find the master profile in the folder `~\Documents\WindowsPowerShell` in a file called `profile.ps1`.  

> :information_source:  
> There are actually a number of profiles on your machine.  We are using the `CurrentUserAllHosts` profile here.  For more info, see https://docs.microsoft.com/en-gb/powershell/module/microsoft.powershell.core/about/about_profiles, but documentation doesn't always seem to line-up with what we see in a PowerShell console.

If the folder or file are not there, you should create it.  You can pick-up our profile from the `scripts` folder in this project (`Documents-WindowsPowerShell-profile.ps1`) and rename it `profile.ps1`.  Remark that you may have to change the marked line at the end, pointing to the default-project profile.

We want to run a different profile depending on the current directory.

- when you open Powershell from the start menu, it will open in a default directory (usually `C:\Windows\System32`)
- when you start PowerShell from a command prompt, it will open in the current directory of the Command Prompt
- when you type `powershell` in the address bar of Windows Explorer, it will open in the current Windows Explorer directory
- when you start PowerShell from a `PowerShell Here` context menu, the current directory will depend on the place where you opened the menu.


Assuming you don't use the `-NoProfile` option, PowerShell will always start executing the master profile.

- The master profile we are using, will look in the current directory, to see if there is a `.psprofile.ps1` file it can run.
- If there is none, it will look in the first parent, grand-parent, ..., up to the user's home directory, for a `.psprofile.ps1` file it can run.
- When it finds one, it will set the `$ROOT` variable to this path and run the profile found.
- When it doesn't find one, it will run the default-project profile and sets the `$ROOT` variable.
- If that also fails, we run the default-master profile and set the `$ROOT` variable to the home directory.


### The project profile

Most of my projects use a profile that's very similar to the `.psprofile.ps1` in the root directory of this project.

- We sets `$ROOT` to the project directory
  - if you pick-up our script, you will need to adapt the path for `$ROOT`.
- We add the `$ROOT\scripts` folder to the path
- If we are not somewhere under the project root-directory, we set the current directory to the project root-directory
- We apply settings to the PowerShell console (see further)
  - for this, you need to copy the `scripts` folder of this `psconsole` project under the `$ROOT\scripts` folder (you can drop the `*profile.ps1` scripts).


```powershell
Set-Variable HOME "$env:USERPROFILE" -Scope Global -Force
( Get-PSProvider 'FileSystem' ).Home = $HOME   # replace "~"

$global:ROOT = "$HOME\Projects\psconsole"
$env:PATH = "$ROOT\scripts;$env:PATH"

if ( -not ( Get-Location ).Path.StartsWith("$ROOT") ) {
    Set-Location "$ROOT"
}

Apply-PSConsoleSettings "PSCONSOLE"
```

> :warning:  
> The `$HOME` variable doesn't always seem to correctly populated, hence we set it in this profile. We experienced a lot of issues with this on different computers and with different versions of PowerShell (probably because of a lack of understanding?).  You can find more info about the `$HOME` variable here: https://docs.microsoft.com/en-gb/powershell/module/microsoft.powershell.core/about/about_automatic_variables, but the documentation doesn't always seem to line-up with what we see in a PowerShell console.
> 
> - By default we use `"$env:USERPROFILE"`.  Although this is in my experience the most reliable way, this variable may not be correctly set on your machine.  
> - An alternative (this is what the PowerShell documentation states as the method it uses "automatically") is to use `"$env:HOMEDRIVE$env:HOMEPATH"`.  Again, this may not work properly on your machine.  
> - You can look for other variables in your environment (or add them) to help you create the correct `$HOME` variable.  
> - You can look for solutions on the web.  
> - Perhaps you need to update some registry items?  
> - Ultimately, as a last resort, you can hard-code your home-path as a string.

> :bulb:  
> We copy the `Apply-PSConsoleSettings` to every project.  This avoids issues when the script gets updated for a new project while scripts and corresponding profiles of old projects are not updated.

### The default-project profile

I like to put all my projects in a `~/Projects` folder so that is where I put my `.psprofile.ps1` file, but you can put it anywhere else and give it any name you want.  You can pick-up our profile from the `scripts` folder in this project (`Projects-.psprofile.ps1`), rename it and adapt it.

- If you are using our master profile, update the marked line at the end of the master profile.

The job of the default-project profile is to select a default project and run its profile.  In our sample default-project profile, we list all our projects in comments in the script, and uncomment the project we consider our "default" at the moment (only uncomment projects that have a project-profile).  This makes it very easy to switch "default" projects.

```powershell
. ~/Projects/psconsole/.psprofile.ps1
#. ~/Projects/kluster/.psprofile.ps1
#. ~/Projects/steps/.psprofile.ps1
#. ~/Projects/globals/.psprofile.ps1   #<<< !!! has no project-profile at the moment
```


### The default-master profile

The last section in the master-profile is the default-master profile.  You can put whatever you want in there.  We use something similar to the project profiles in our default-master profile

- We set `$ROOT` to the home directory
- We add the `~\Documents\WindowsPowerShell\scripts` folder to the path
- If we are not somewhere under the home directory, we set the current directory to the home directory
- We apply settings to the PowerShell console (see further)
  - for this, you need to copy the `scripts` folder of this project under the `~\Documents\WindowsPowerShell` folder (you can drop the `*profile.ps1` scripts).


```powershell
$global:ROOT = $HOME
$env:PATH = "$ROOT\Documents\WindowsPowerShell\scripts;$env:PATH"

if ( -not ( Get-Location ).Path.StartsWith("$ROOT") ) {
    Set-Location "$ROOT"
}

Apply-PSConsoleSettings
```


<br/>

## Console Properties

There are lots of properties that can be changed, but we will focus on colors:
- The color palette used by the console (as defined in the properties of a shortcut to PowerShell)
- The foreground and background colors of the console
- The colors of the output to various streams
- The colors used for syntax-highlighting
- The colors of the prompt

A couple of other properties we want to adapt
- The title of the PowerShell console window, including an indication when we are running in elevated mode
- An indication in the prompt when we are running in elevated mode

To control all of this, we use a script `Apply-PSConsoleSettings.ps1` in combination with a JSON configuration file.  You can find the default configuration for a project in `$ROOT\.psconsole.json`.

### The window title and prompt

### The color palette

### The colors of the console

### The colors of the output to streams

### The colors of the syntax-highlighting

### The colors of the prompt

<br/>

## For Further Investigation

- Support for early versions of PowerShell v5.x using PSReadLine v1.x
