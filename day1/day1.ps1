$nums=get-content input
foreach ($num in $nums) {
    for ($i = 0; $i -le ($nums.Length-1); $i++) {
        if ([int]$nums[$i] + [int]$num -eq [int]2020) {
            $result = [int]$nums[$i] * [int]$num
            Write-Output "numbers are: $([int]$nums[$i]) and $([int]$num) which mutiplied together equals $result"
            break loop
        }
    }
}

#part2
$nums=get-content input
foreach ($num in $nums) {
    for ($i = 1; $i -le ($nums.Length-1); $i++) {
        for ($n = 1; $n -le ($nums.Length-1); $n++) {
            if ([int]$nums[$i] + [int]$nums[$n] + [int]$num -eq [int]2020) {
                $result = [int]$nums[$i] * [int]$num * [int]$nums[$n]
                Write-Output "numbers are: $([int]$nums[$i]) and $([int]$num) and $([int]$nums[$n]) which mutiplied together equals $result"
                break loop
            }
        }
    }
}