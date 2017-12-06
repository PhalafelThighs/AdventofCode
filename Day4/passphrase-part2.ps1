<#--- Part Two ---
For added security, yet another system policy has been put in place. Now, a valid passphrase must contain no two words that are anagrams of each other - that is, a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.
For example:
abcde fghij is a valid passphrase.
abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
iiii oiii ooii oooi oooo is valid.
oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
Under this new system policy, how many passphrases are valid?
sort each word, see if they match

$ArrayLinePassphrase = @()
$SortedLine = @()
$fail = 0

$txtPassphrase = get-content "M:\My Documents\PowershellScripts\AdventOfCode\Day4\PassphraseInput.txt"
foreach ($linePassphrase in $txtPassphrase) {
    $fail = 0
    $ArrayLinePassphrase = $linePassphrase -split ' ' | sort-object
    foreach ($ArrayWordPassphrase in $ArrayLinePassphrase) {
        $SortedLine = $SortedLine + $ArrayWordPassphrase | Sort-Object
        write-host $ArrayWordPassphrase
        write-host $SortedLine
        Write-host
    }
    for ($i = 0; $i -le $SortedLine.GetUpperBound(0); $i++) {
        if ($SortedLine[$i] -eq $SortedLine[$i+1]) {
            $fail = 1
        }
        $i = $i + 1
    }
#    for ($i = 0; $i -le $SortedWord.GetUpperBound(0); $i++) {
#        if ($ArrayLinePassphrase[$i] -eq $ArrayLinePassphrase[$i+1]) {
#            $fail = 1
#        }
#    }
    if ($fail -ne 1) {
        write-host $linePassphrase
        $total = ($total+1)
    }
    $sortedLine = ''
}
write-host $total
#>
gc "M:\My Documents\PowershellScripts\AdventOfCode\Day4\PassphraseInput.txt" | ?{ !(-split $_ | %{ -join ([char[]]$_ | sort) } | group | ? Count -gt 1)} | measure