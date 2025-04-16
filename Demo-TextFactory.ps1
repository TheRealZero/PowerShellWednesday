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
        [ValidateSet("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")]
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
$alphabet = @("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")


$task1 = @"
Hello!  My name is Joe!
And I work in Automation IT.
One day my boss came up to me and said "Hey Joe! Are you Busy?"
I said "No."
He said "Then turn these letters into uppercase!"
"@

$task2 =@"
Hello!  My name is Joe!
And I work in Automation IT.
One day my boss came up to me and said "Hey Joe! Are you Busy?"
I said "No."
He said "Then append unicode index numbers to the letters you recieve in the pipline or from input into your parameters!"
"@
$task3 = @"
Hello!  My name is Joe!
And I work in Automation IT.
One day my boss came up to me and said "Hey Joe! Are you Busy?"
I said "No."
He said "Then make these letters shine brightly!"
"@
