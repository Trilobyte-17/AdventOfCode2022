$filepath = '.\Input.txt'
$pairings = Get-Content -Path $filepath
$count = 0

foreach($pair in $pairings)
{
    $split = $pair.split(',')

    #get the first spit lower and upper number
    $first = $split[0].Split('-')
    $second = $split[1].Split('-')

    if(($first[0] -le $second[0]) -and ($first[1] -ge $second[1]))
    {
        $count +=1

             
    }
    elseif(($second[0] -ge $first[0]) -and ($second[1] -le $first[1]))
    {
        $count +=1
    }
    else
    {}

    Write-Host $pair
        $First[0]
        $first[1]
        $second[0]
        $second[1]
        $first[0] -le $second[0]
        $first[1] -ge $second[1]
        $second[0] -ge $first[0]
        $second[1] -le $first[1]
        Write-host $count
        read-host  
}
Write-host $count