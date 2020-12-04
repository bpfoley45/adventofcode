#PART ONE

$ALLPassports=@()
$BirthYear=""
$IssueYear=""
$ExpirationYear=""
$Height=""
$HairColor=""
$PassportID=""
$CountryID=""
$passports = (((Get-content input) -replace " ", "`r`n") -replace ":", "=") > inputnew
$stream_reader = New-Object System.IO.StreamReader { C:\b\git\adventofcode2020\day04\inputnew }
$line_number = 1
while (($currentline = $stream_reader.ReadLine()) -ne $null) {
    if ($currentline -ne "") {
        echo $currentline "wee"
        switch ($currentline.split("=")[0]) {
            "byr" { $BirthYear = $currentline.Split("=")[1] }
            "iyr" { $IssueYear = $currentline.Split("=")[1] }
            "eyr" { $ExpirationYear = $currentline.Split("=")[1] }
            "hgt" { $Height = $currentline.Split("=")[1] }
            "hcl" { $HairColor = $currentline.Split("=")[1] }
            "ecl" { $EyeColor = $currentline.Split("=")[1] }
            "pid" { $PassportID = $currentline.Split("=")[1] }
            "cid" { $CountryID = $currentline.Split("=")[1] }
        }
    }
    else {
        #BLANK LINE SO DONE AND DUMP TO PSCUSTOMOBJECT
        $ALLPassports+=[PSCustomObject]@{
            BirthYear      = $BirthYear
            IssueYear      = $IssueYear
            ExpirationYear = $ExpirationYear
            Height         = $Height
            HairColor      = $HairColor
            EyeColor       = $EyeColor
            PassportID     = $PassportID
            CountryID      = $CountryID
        }
        #reset vars for next iteration
        $BirthYear=""
        $IssueYear=""
        $ExpirationYear=""
        $Height=""
        $HairColor=""
        $PassportID=""
        $CountryID=""
    }
    $line_number++
}

$result=0
foreach ($pass in $ALLPassports) {
    if (($pass.BirthYear -ne "") -and
        ($pass.IssueYear -ne "") -and
        ($pass.ExpirationYear -ne "") -and
        ($pass.Height -ne "") -and
        ($pass.HairColor -ne "") -and
        ($pass.EyeColor -ne "") -and
        ($pass.PassportID -ne "")) {
            $result++
    }
}
$result






