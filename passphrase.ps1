<#--- Day 4: High-Entropy Passphrases ---

A new system policy has been put in place that requires all accounts to use a passphrase instead of simply
 a password. A passphrase consists of a series of words (lowercase letters) separated by spaces.

To ensure security, a valid passphrase must contain no duplicate words.

For example:

aa bb cc dd ee is valid.
aa bb cc dd aa is not valid - the word aa appears more than once.
aa bb cc dd aaa is valid - aa and aaa count as different words.
The system's full passphrase list is available as your puzzle input. How many passphrases are valid?

Input = \\sync-al\files$\JV-880707\tmcbrien\My Documents\PowershellScripts\AdventOfCode\Day4\passphraseInput.txt
#>
$ArrayLinePassphrase = @()

$txtPassphrase = get-content "M:\My Documents\PowershellScripts\AdventOfCode\Day4\PassphraseInput.txt"
foreach ($linePassphrase in $txtPassphrase) {
    $fail = 0
    $ArrayLinePassphrase = $linePassphrase -split ' ' | sort-object
    for ($i = 0; $i -le $ArrayLinePassphrase.GetUpperBound(0); $i++) {
        if ($ArrayLinePassphrase[$i] -eq $ArrayLinePassphrase[$i+1]) {
            $fail = 1
        }
    }
    if ($fail -ne 1) {
        write-host $linePassphrase
        $total = ($total+1)
    }
}
write-host $total



