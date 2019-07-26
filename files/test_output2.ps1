$vm = [PSCustomObject]@{
    name = 'server01'
    os = 'Windows'
    ipAddress = '10.0.3.4'
}

$vmJson = $vm | ConvertTo-Json

Write-Output $vmJson