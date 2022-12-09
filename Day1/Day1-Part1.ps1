#Input file path
$InputFilePath = ".\input.txt"
#Load in file
$ElfInput = get-content -path $InputFilePath
#
$MaxCalories = 0
#
$runningtotal = 0

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
        #check to see if we have new max total 
        If($runningtotal -gt $MaxCalories)
        {
            #set new max total 
            $MaxCalories = $runningtotal
        }
        #reset the running total to 0
        $runningtotal = 0
    }
}
#show the max calories determined
Write-Host $MaxCalories