# define this function in your powershell $profile file.
# it will print the current time as part of your prompt.
function prompt {
    $brightBlueForeground = "$([char]27)[94m"
    $defaultColor = "$([char]27)[0m"

    $cwd = $executionContext.SessionState.Path.CurrentLocation
    $date = Get-Date -Format "HH:mm:ss"
    $rocket = [System.Char]::ConvertFromUtf32(0x1F680)

    "$cwd $brightBlueForeground($date)$defaultColor $rocket "
}

# Dracula colors for PSReadLine
# colors from https://github.com/dracula/powershell
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
