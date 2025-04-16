$1 = Get-Service -Name "PLA"
$2 = "PLA" | Get-Service
$3 = Get-Service
$4 = $3 | Where-Object { $_.Name -eq "PLA" }

Dem

https://www.youtube.com/watch?v=qs4NdbdH5aY

Get-Process | Where-Object { $_.CPU -gt 0 } | Sort-Object WorkingSet -Descending | Select-Object -First 10
