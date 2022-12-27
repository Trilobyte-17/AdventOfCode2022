$filepath = '.\Input.txt'
$rucksacks = Get-Content -Path $filepath
$grandtotal = 0

#load in apha char's in order what they will be scored 
$alph=@()
97..122|foreach-object{$alph+=[char]$_}
65..90|foreach-object{$alph+=[char]$_}

foreach ($rucksack in $rucksacks)
{
    #get half of each rucksack
    $Split1 = $rucksack.Substring(0,($rucksack.length/2))    
    $Split2 = $rucksack.Substring(($rucksack.length/2))

    #Loop looking for matching letter
    $i=0
    While($i -le ($Split1.Length-1)) #-1 due to 0 base in array
    {
        if ($Split2.Contains($split1[$i]))
        {
            Write-host "Match"
            Write-Host $Split1[$i]
            #Take the index of the alph and +1 for 0 indexing 
            $grandtotal += $alph.IndexOf([char]$split1[$i])+1

            #if we have a match then stop
            $i=$Split1.Length
        }
        $i++
    }
    
}
Write-host $grandtotal

