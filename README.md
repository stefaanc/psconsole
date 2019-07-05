# PSConsole

**some scripts to work with different Windows PowerShell profiles and to initialize a Windows PowerShell console**

If you are like me, working on a couple of projects at the same time, it is a real hassle to go and change the PowerShell profile settings in `~\Documents\WindowsPowerShell`.  So I needed a better system to do this.

My requirements are:
- When starting PowerShell from anywhere within a project, pick-up the project's profile
- When starting Powershell from outside a project, pick-up a default profile


Also, it is really not easy to find out how to change the colors for the PowerShell console.  There are an enormous amount of web-pages on this subject, lots of different methods to try.  Different methods for different versions of PowerShell.  I needed to find the best way for me.

My requirements are:
- Changing the colors of the PowerShell console
- Changing the window title and some colors for different projects
- Changing the window title and some colors when running as 'Administrator'


## Project Profiles

### The master profile

You can find the master profile in the folder `~\Documents\WindowsPowerShell` in a file called `profile.ps1`.  

If the folder or file are not there, you should create it.  You can pick-up ours from the `scripts` folder in this project (`Documents-WindowsPowerShell-profile.ps1`) and rename it to `profile.ps1`.  Remark that you may have to change the marked line at the end, pointing to the default profile.

We want to run a different profile depending on the current directory.
- when you open Powershell from the start menu, it will open in a default directory (usually `C:\Windows\System32`)
- when you start PowerShell from a command prompt, it will open in the current Command Prompt directory
- when you type `powershell` in the address bar of Windows Explorer, it will open in the current Windows Explorer directory
- when you start PowerShell from a `PowerShell Here` context menu, the current directory will depend on the place where you opened the menu.


 Assuming you don't use the `-NoProfile` option, PowerShell will always start executing the master profile. 

- The master profile we are using, will look in the current directory, to see if there is a `.psprofile.ps1` file it can run.
- If there is none, it will look in the first parent, grand-parent, ..., up to the user's home directory, for a `.psprofile.ps1` file it can run.
- When it finds one, it will set the `$ROOT` variable to this path and run the profile found.
- When it doesn't find one, it will run the default profile.

### The default profile

I like to put all my projects in a `~/Projects` folder so that is where I put my `.psprofile.ps1` file, but you can put it anywhere else and give it any name you want.  You can pick-up ours from the `scripts` folder in this project (`Projects-.psprofile.ps1`), rename it and adapt it.

- If you are using our master profile, update the marked line at the end of the master profile.

### The project profile

<br/>

## Console Properties

There are lots of properties that can be changed, but we will focus on colors:
- The color palette used by the console (as defined in the shortcut to PowerShell)
- The foreground and background colors of the console
- The colors of the output to the various streams
- The colors used for syntax-highlighting
- The color of the prompt

A couple of other properties we want to set
- The title of the PowerShell console window, including an indication when we are running in elevated mode
- An indication in the prompt when we are running in elevated mode

<br/>

## For Further Investigation

- Support for early versions of PowerShell v5.x using PSReadLine v1.x
