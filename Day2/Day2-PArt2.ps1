$filepath = '.\Input.txt'
$games = Get-Content -Path $filepath
$GrandTotal = 0

function Get-Points 
{
    param(
        [Parameter(ValueFromPipeline)]$h1)

    $total = 0

    switch ($h1)
    {
        #Rock
        "a" {$total = $total +1}
        #paper
        "b" {$total = $total +2}
        #sisers
        "c" {$total = $total +3} 
        Default {}
    }
    Write-Output $total}

function Get-LosingHand{
    Param([Char]$h)

    switch ($h) {
        #IF Rock then Scissors
        "A" { $out = "C" }
        #if Paper then rock
        "B" { $out = "A"}
        #if Scissors then paper
        "C" { $out = "B"}
        Default {}
    }

    Write-Output $out
}

function Get-WinningHand{
    Param([Char]$h)

    switch ($h) {
        #IF Rock then Paper
        "A" { $out = "B" }
        #if Paper then Scissors
        "B" { $out = "C"}
        #if Scissors then Rock
        "C" { $out = "A"}
        Default {}
    }

    Write-Output $out
}




foreach($line in $games)
{
    #Lose
    if ($line.Chars(2) -eq 'X')
    {
        $GrandTotal +=  (Get-LosingHand $line.Chars(0) | Get-Points)+0
    }
    #Draw
    elseif ($line.Chars(2) -eq 'Y')
    {
        #points for Hand + 3 for a draw
        $GrandTotal += ($line.Chars(0) | Get-Points)  +3
    }
    #Win
    elseif ($line.Chars(2) -eq 'Z')
    {
        $GrandTotal += (Get-WinningHand $line.Chars(0)|Get-Points) + 6
    }
    else {
        Wite-host "Broken"
        Read-Host
    }    
}

write-host $GrandTotal