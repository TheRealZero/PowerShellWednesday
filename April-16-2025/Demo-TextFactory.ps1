Function Convertto-UpperCase {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]]$Text
    )
    Process {
        Foreach ($txt in $Text) {
            Write-Output $Text.ToUpper()
        }
    }
}

Function Invoke-Colourizer {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$Text,
        [string]$Colour = "Green"
    )
    Process {
        Foreach ($txt in $Text) {
        
            Write-Output "$($PSStyle.Foreground.$Colour)$txt$($PSStyle.Reset)"
        }
    }
}
Function Add-UnicodeIndex {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidatePattern("^[a-zA-Z]{1}$")]
        [ValidateNotNullOrEmpty()]
        [string[]]$Letter
    )
    Process {
        Foreach ($ltr in $Letter) {
            $Bytes = [system.Text.Encoding]::UTF8.GetBytes($ltr)

            Write-Output "$ltr$Bytes"
        }
    }
}
$alphabet = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")


$task1 = @"
Hello!  My name is Joe!
And I work in Automation IT.
One day my boss came up to me and said "Hey Joe! Are you Busy?"
I said "No."
He said "Then turn these letters into uppercase!"
"@

$task1Result = $alphabet|Convertto-UpperCase

$task2 =@"
Hello!  My name is Joe!
And I work in Automation IT.
One day my boss came up to me and said "Hey Joe! Are you Busy?"
I said "No."
He said "Then append unicode index numbers to the letters you recieve in the pipline or from input into your parameters!"
"@

$task2Result = $alphabet | Add-UnicodeIndex

$task3 = @"
Hello!  My name is Joe!
And I work in Automation IT.
One day my boss came up to me and said "Hey Joe! Are you Busy?"
I said "No."
He said "Then make these letters shine brightly!"
"@

$task3Result = $alphabet | Invoke-Colourizer -Colour "Cyan"

$task1
$task1Result
$task2
$task2Result
$task3
$task3Result
Write-Output "All together now!"
$alphabet | Convertto-UpperCase | Add-UnicodeIndex | Invoke-Colourizer -Colour "Cyan"