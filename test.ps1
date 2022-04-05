#.bam to .egg converter
# Zeb Hering
# 4/4/2022
$filepath = 'Z:\Mylez\Projects\Tlopo\Old Potco Files\2008 potco\phases in one place\' #This is our file path the script will operate out of
cd $filepath

$bamfiles = @(Get-ChildItem -Path $filepath -Filter *.bam -Recurse) #get all .bam files in $filepath
$eggfiles = @(Get-ChildItem -Path $filepath -Filter *.bam -Recurse)

Write-Host 'Building Array'

for ($i = 0 ; $i -le $bamfiles.Length ; $i++){
    #building the array
    Write-Host 'Found '$bamfiles[$i]
    $eggfiles[$i] = $eggfiles[$i] -Replace '\.bam$','.egg'
    Write-Host 'Should come out to '$eggfiles[$i]
    Write-Host '
    '

}

for ($j = 0 ; $j -le $bamfiles.Length ; $j++){
  
    .\bam2egg.exe $bamfiles[$j].toString() $eggfiles[$j].toString()  #actually connverts the bam files to .egg
    Write-Host "Successfully converted "$bamfiles[$j]" to "$eggfiles[$j]
}