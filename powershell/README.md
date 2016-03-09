# Windows PowerShell

So, yeah, there is partial support for Windows PowerShell now.

The contents of this folder should go to $HOME\Documents\WindowsPowerShell
(or %USERPROFILE%\Documents\WindowsPowerShell if using old syntax). You
might copy this folder or symlink it.

There is support for symlinks on Windows using mklink. I even made a
cmdlet on my profile.ps1 for creating these symlinks named Create-SymLink.
However, it is way harder to create symlinks on Windows since they are
restricted to administrator users. In other words: normal users cannot
create symlinks by default. To create a symlink, you need to start PowerShell
or MS-DOS Shell as an Administrator.