$esc=$([char]27) # esc or `e in ASCII table
$promtSymbol = "  "

function Prompt {
    $currentDir = (Get-Location | Get-Item).Name
    "$esc[38;2;35;170;242;48;2;230;230;230m$promtSymbol$esc[0m$esc[38;2;0;0;0;48;2;230;230;230m Windows $esc[0m$esc[38;2;230;230;230;48;2;35;170;242m$esc[0m$esc[38;2;35;170;242;48;2;230;230;230m$esc[0m$esc[38;2;230;230;230;48;2;35;170;242m$esc[0m$esc[38;2;247;187;7;48;2;35;170;242m  $esc[0m$esc[38;2;255;255;255;48;2;35;170;242m $currentDir $esc[0m$esc[38;2;35;170;242m $esc[0m"
}
