#PART1

$lines = Get-Content input
$trees = 0
$loc = 3
#start on line 
for ($i = 1; $i -lt $lines.count; $i ++) {
    if ($lines[$i].ToCharArray()[$loc] -eq "#") {
        $trees++
    }
    $loc = ($loc + 3) % 31
}
$trees



