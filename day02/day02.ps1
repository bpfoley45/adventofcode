#PART ONE
$passwords=get-content input | % {
    [PSCustomObject]@{
        Policy = (($_ -split ":").trim())[0]
        Password = (($_ -split ":").trim())[1]
    }
}

$results=0
foreach($password in $passwords){
    $lettermatch=($password.Policy -split " ")[1]
    $occurancege=($password.Policy -split " ").split("-")[0]
    $occurancele=($password.Policy -split " ").split("-")[1]
    $count=(($password.Password).ToCharArray() -eq $lettermatch).count
    if (($count -ge $occurancege) -and ($count -le $occurancele)) {
        $results++
    }
}
$results


#PART TWO
$passwords=get-content input | % {
    [PSCustomObject]@{
        Policy = (($_ -split ":").trim())[0]
        Password = (($_ -split ":").trim())[1]
    }
}

$results=0
foreach($password in $passwords){
    $lettermatch=($password.Policy -split " ")[1]
    $occuranceloc1=($password.Policy -split " ").split("-")[0]
    $occuranceloc2=($password.Policy -split " ").split("-")[1]

    $loc1match=($password.Password).ToCharArray()[$occuranceloc1-1] -eq $lettermatch
    $loc2motch=($password.Password).ToCharArray()[$occuranceloc2-1] -eq $lettermatch

    if ($loc1match -bxor $loc2motch) {
        $results++
    }
}
$results

