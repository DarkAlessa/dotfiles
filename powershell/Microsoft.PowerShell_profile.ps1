$esc=$([char]27) # esc or `e in ASCII table
$promtSymbol = " "

function Prompt {
    $currentDir = (Get-Location | Get-Item).Name
    "$esc[38;2;230;230;230m$esc[0m$esc[38;2;0;116;207;48;2;230;230;230m$promtSymbol$esc[0m$esc[38;2;230;230;230m$esc[0m$esc[38;2;0;116;207m$esc[0m$esc[38;2;247;187;7;48;2;0;116;207m  $esc[0m$esc[38;2;255;255;255;48;2;0;116;207m $currentDir $esc[0m$esc[38;2;0;116;207m$esc[0m "
}
