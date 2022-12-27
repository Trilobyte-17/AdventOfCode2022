$filepath = '.\Input.txt'
$rucksacks = Get-Content -Path $filepath
$grandtotal = 0

#load in apha char's in order what they will be scored 
$alph=@()
97..122|foreach-object{$alph+=[char]$_}
65..90|foreach-object{$alph+=[char]$_}

#get 3 rucksacks
$n=0
#Check that we haven't got to the end of the array
While($n -le $rucksacks.Length-2)
{
    #get 3 rucksacks $n the start position and $n+2 the end
    $Group = $rucksacks[$n..($n+2)]

    $i=0
    #for each char in the first rucksack
    while($i -le $group[0].Length)
    {
        #Check if its in the second and in then 3rd rucksack
        if (($group[1].Contains($group[0][$i])) -and ($group[2].Contains($group[0][$i])))
        {
            #lookup total by using index +1 of the alphabet list
            $grandtotal += $alph.IndexOf([char]$Group[0][$i])+1     
            
            #if we have a match then stop
            $i=$group[0].Length+1
        }
        $i++
    }
    #Incement the rucksack lookups by 3
    $n = $n+3
}

Write-host $grandtotal