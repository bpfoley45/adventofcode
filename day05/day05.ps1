
$passes = get-content input

$Results=@()
#iterate through all boarding passes
foreach ($pass in $passes) {
    $rows = 0..127 # 0 indexed, 128 rows
    #iterate through each letter of the boarding pass minus last 3 for column
    for ($i = 0; $i -le ($pass.length - 3); $i ++) {
        switch ($pass[$i]) {
            #lowerhalf (front of plabe)
            "F" {   
                #last iteration pick front row of remaining
                if ($i -eq 6) {
                    #echo "last F on $i"
                    $rows = $rows[0]
                }
                else {
                    #echo " switch F on $i"
                    $rows = $rows[0..([int]($rows.GetUpperBound(0) / 2) - 1)]
                }
            }
            #upper half (rear of plane)
            "B" {
                #last iteration pick last row of remaining
                if ($i -eq 6) {
                    #echo "last B on $i"
                    $rows = $rows[1]
                }
                else {
                    #echo " switch B on $i"
                    $rows = $rows[[int]($rows.GetUpperBound(0) / 2)..($rows.GetUpperBound(0))]
                }
            }
        }
    }
    #$rows
    #now iterate through last 3 letters of the boarding pass to get column info
    $columns=0..7 #0 indexed, 8 columns
    for ($i = ($pass.Length-3); $i -le ($pass.length); $i ++) {
        #$i
        #$pass[$i]
        switch ($pass[$i]) {
            #lowerhalf (front of plabe)
            "L" {   
                #last iteration pick front row of remaining
                if ($i -eq 9) {
                    #echo "last L on $i"
                    $columns = $columns[0]
                }
                else {
                    #echo " switch L on $i"
                    $columns = $columns[0..([int]($columns.GetUpperBound(0) / 2) - 1)]
                }
            }
            #upper half (rear of plane)
            "R" {
                #last iteration pick last row of remaining
                if ($i -eq 9) {
                    #echo "last R on $i"
                    $columns = $columns[1]
                }
                else {
                    #echo " switch R on $i"
                    $columns = $columns[[int]($columns.GetUpperBound(0) / 2)..($columns.GetUpperBound(0))]
                }
            }
        }
        #$columns
    }
    $uniqueSeatID=($rows*8)+$columns
    $Results+=[PSCustomObject]@{
        BoardingPass = $pass
        SeatID = $uniqueSeatID
        Row = $rows
        Column = $columns
    }
    #break
}
$Results

#sort results and find highest
$results | ogv

#PART 2

#Get Highest Row # then go and figure out which row is missing a seat
1..[int](($Results.row | measure -Maximum).Maximum) | % {
    $num = $_
    if (($Results | Where-Object {$_.Row -eq $num}).count -ne 8) {
        $myrow=$_
    }
}

0..7 | % {
    $num = $_
    if ((($Results | Where-Object {$_.Column -eq $num}).count -ne [int](($Results.row | measure -Maximum).Maximum)) -and 
    ($Results | Where-Object {$_.Column -eq $num}).count -le [int](($Results.row | measure -Maximum).Maximum)) {
        $mycolumn=$_
    }
}

$myseat=($myrow*8)+5
echo $myseat