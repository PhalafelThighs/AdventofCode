<#--- Part Two ---
Now, the jumps are even stranger: after each jump, if the offset was three or more, instead decrease 
it by 1. Otherwise, increase it by 1 as before.
Using this rule with the above example, the process now takes 10 steps, and the offset values after 
finding the exit are left as 2 3 2 3 -1.
How many steps does it now take to reach the exit?
#>

$TrampolineList = @()   # Array of Trampoline Values split by line
$MaxLocation = ''       # Max elements in TrampolineList
$CurrentLocation = 0    # array location
$CurrentValue = 0       # Value of element in array at current location
$NewLocation = 0
$Diff = 0 
$i = 0

$TrampolineList = get-content "\\sync-al\files$\JV-880707\tmcbrien\My Documents\PowershellScripts\AdventOfCode\Day5\trampoline.txt"
$TrampolineList = $TrampolineList -split('[\r\n]')
$MaxLocation = $TrampolineList.Length

while (($CurrentLocation -lt $MaxLocation) -and ($CurrentLocation -gt -1))  {
    $CurrentValue = [int]::parse($TrampolineList[$CurrentLocation])
    $NewLocation = ($CurrentLocation + $CurrentValue)
    $Diff = ($NewLocation - $CurrentLocation)
    if (($Diff -gt 3) -or ($Diff -eq 3)) {
        $CurrentValue = ($CurrentValue - 1)
    } else {
        $CurrentValue = $CurrentValue + 1
    }
    $TrampolineList[$CurrentLocation] = $CurrentValue
    $CurrentLocation = $NewLocation
    $i = $i + 1
    if (0 -eq $i % 10000) {
        write-host "Iterations:         $i"
    }
} 
 
write-host $i