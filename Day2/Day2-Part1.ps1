$filepath = '.\Input.txt'

$wins = @{'C X'= 8;'A Y'= 8;'B Z'=8}
$draws = @{'A X'=3;'B Y'=3;'C Z'=3}
$hand = @{'X'=1;'Y'=2;'Z'=3}
$total = 0

$games = Get-Content -Path $filepath

foreach($line in $games)
{
    $HandValue = $hand.Item($line.Chars(2).toString())

    #check if a win
    if($wins.contains($line))
    {
        $total = $total + 6 + $HandValue
        
    }
    elseif($Draws.Contains(($line)))
    {
        $total = $total + 3 + $HandValue
    }
    else {
        $total = $total + $HandValue
    }
}

write-host $total