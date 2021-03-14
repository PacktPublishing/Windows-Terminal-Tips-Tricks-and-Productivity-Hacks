# Default location: ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#
# Module installations (required only one time)
# Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
# Install-Module -Name posh-git -Scope CurrentUser
# Install-Module -Name oh-my-posh -Scope CurrentUser
# Install-Module -Name z -Scope CurrentUser -AllowClobber

if ($host.Name -eq 'ConsoleHost') # only apply to terminals, don't apply to e.g. ISE.
{
    Import-Module PSReadLine
    
    # use vi bindings, but selectively re-enable some others like copy/paste
    Set-PSReadLineOption -EditMode Vi
    Set-PSReadLineKeyHandler -Key Ctrl+a -Function SelectAll
    Set-PSReadLineKeyHandler -Key Ctrl+c -Function CopyOrCancelLine
    Set-PSReadLineKeyHandler -Key Ctrl+x -Function Cut
    Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste
    Set-PSReadLineKeyHandler -Key Shift+LeftArrow -Function SelectBackwardChar
    Set-PSReadLineKeyHandler -Key Shift+RightArrow -Function SelectForwardChar
    Set-PSReadLineKeyHandler -Key Ctrl+Shift+LeftArrow -Function SelectBackwardWord
    Set-PSReadLineKeyHandler -Key Ctrl+Shift+RightArrow -Function SelectNextWord

    Set-PSReadlineOption -BellStyle None
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadlineKeyHandler -Key Ctrl+Shift+C `
         -BriefDescription CopyPathToClipboard `
         -LongDescription "Copies the current path to the clipboard" `
         -ScriptBlock { (Resolve-Path -LiteralPath $pwd).ProviderPath.Trim() | clip }
    
    # Dracula colors for PSReadLine -- works in conhost and wt -- install colors from https://github.com/dracula/powershell
    Set-PSReadlineOption -Color @{
        "Command" = [ConsoleColor]::Green
        "Comment" = [ConsoleColor]::DarkCyan
        "ContinuationPrompt" = [ConsoleColor]::White
        "Default" = [ConsoleColor]::White
        "Emphasis" = [ConsoleColor]::Cyan
        "Error" = [ConsoleColor]::Red
        "InlinePrediction" = [ConsoleColor]::DarkCyan
        "Keyword" = [ConsoleColor]::Green
        "Member" = [ConsoleColor]::White
        "Number" = [ConsoleColor]::Blue
        "Operator" = [ConsoleColor]::Magenta
        "Parameter" = [ConsoleColor]::Gray
        "String" = [ConsoleColor]::Yellow
        "Type" = [ConsoleColor]::Cyan
        "Variable" = [ConsoleColor]::White
    }

    Import-Module oh-my-posh
    Set-PoshPrompt -Theme ~/.oh-my-posh.omp.json

    # track frequently used directories and jump to them with z
    Import-Module z

    # use the coreutils ls instead of Get-ChildItem
    function ls_alias { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF $args }
    Set-Alias -Name ls -Value ls_alias -Option Private
}
