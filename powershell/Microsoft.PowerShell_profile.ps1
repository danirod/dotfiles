# danirod's ps1 profile

# Use UTF-8 instead of old and clunky MS-DOS codepages. This should be the
# default and I don't understand why it isn't, even on Windows 10. Sigh.
chcp 65001 > $null

# Load private profile if it exists.
$PrivateProfile = $(Split-Path -Parent $profile) + '\' + $env:computername + '.ps1'
if (Test-Path -PathType Leaf $PrivateProfile) {
    . $PrivateProfile
}

# Based on steeef theme from Oh-My-Zsh.
function prompt {
    Write-Host -foregroundcolor white
    Write-Host $env:username -nonewline -foregroundcolor magenta
    Write-Host " at " -nonewline -foregroundcolor white
    Write-Host $env:computername -nonewline -foregroundcolor yellow
    Write-Host " in " -nonewline -foregroundcolor white
    Write-Host $pwd -foregroundcolor green
    Return "> "
}

function Create-SymLink
{
    <#
    .SYNOPSIS
    Creates a link using mklink.

    .DESCRIPTION
    Creates a link using mklink. It has to invoke a MS-DOS shell since
    PowerShell does not support mklink yet. It uses UNIX-like syntax on
    their arguments. Keep in mind that there are security restrictions
    on which users can create symbolic links.

    .PARAMETER target
    What file or directory to symlink.

    .PARAMETER linkname
    Where to put the symlink.
    #>
    param(
        [Parameter(Mandatory=$true)][string] $target,
        [Parameter(Mandatory=$true)][string] $linkname
    )

    # TODO: Make linkname optional, use PWD unless given.

    # The syntax depends on whether the target is a folder (container) or a
    # directory (leaf). Just like on UNIX, folders cannot be hardlinked.
    if (Test-Path -PathType Container $target) {
        invoke-expression "cmd /c mklink /d $linkname $target"
    } else {
        invoke-expression "cmd /c mklink $linkname $target"
    }
}
