
### PART ONE

#need to use raw to delimit by newline
$questions=(get-content input -raw) -split "\n\r"

$results=0

foreach ($question in $questions) {
    $results+=(($question.ToCharArray() | Group-Object | ? {$_.name -match '[a-z]'}).group | select -Unique).count
}
$results



### PART TWO

$questions=(get-content input -raw) -split "\n\r"

$results=0

foreach ($question in $questions) {
    #how manu people
    $persons=($question -split "\n" | ? {$_} | measure -Line).lines
    #how many answers match on group object equal to # of persons
    $results+=((($question.ToCharArray() | Group-Object | ? {$_.name -match '[a-z]'})) | ? {$_.Count -eq $persons} | measure).Count
}
$results

