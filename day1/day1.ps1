$nums=gc input
foreach ($num in $nums) {
    for ($i = 0; $i -le $nums.Length; $i++) {
        if ([int]$nums[$i] + [int]$num -eq [int]2020) {
            $result = [int]$nums[$i] * [int]$num
            Write-Output "numbers are: $([int]$nums[$i]) and $([int]$num) which mutiplied together equals $result"
            break loop
        }
    }
}

