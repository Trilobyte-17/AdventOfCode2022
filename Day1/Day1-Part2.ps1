#Input file path
$InputFilePath = ".\input.txt"
#Load in file
$ElfInput = get-content -path $InputFilePath
#
$runningtotal = 0
#
$elfCount = 1
#
$ElfList = @{}

#create elf record
foreach($line in $ElfInput)
{    
    #check if we are at a blank line
    if($line -ne '')
    {
        #if we are not at a blank line add to the running total 
        $runningtotal = $runningtotal+$line
    }
    #if are are at a blank line - finished with this elf
    else {

        $ElfList.add($elfCount,$runningtotal)

        #reset the running total to 0
        $runningtotal = 0
        #Increase elf count
        $elfCount = $elfCount + 1
    }
}

$sortedelfs = $ElfList.GetEnumerator() | Sort-Object Value -Descending

$TopThreeTotal = 0
$i = 0
while($i -ne 3)
{
    $TopThreeTotal = $TopThreeTotal + $sortedelfs[$i].Value
    $i++
}

Write-Host $TopThreeTotal