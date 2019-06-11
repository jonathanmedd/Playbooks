#Requires -RunAsAdministrator
$ErrorActionPreference ='Stop'

# Start Scheduled Task
try {
    Get-ScheduledTask -TaskName scvmm_test | Start-ScheduledTask
}
catch {

    Write-Error "Unable to Start Scheduled Task" -ErrorAction Continue
    Write-Error $_.Exception.Message -ErrorAction Continue
    exit 1
}
