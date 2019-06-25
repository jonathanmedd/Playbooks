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



# Check state
try {

    $timeout = 18000 ##  seconds

    $timer =  [Diagnostics.Stopwatch]::StartNew()

    while (((Get-ScheduledTask -TaskName 'scvmm_test').State -ne  'Ready') -and  ($timer.Elapsed.TotalSeconds -lt $timeout)) {

    Write-Verbose  -Message "Waiting on scheduled task..."

    Start-Sleep -Seconds 30

    }

    $timer.Stop()

}

catch {

    Write-Error "Unable to check state" -ErrorAction Continue
    Write-Error $_.Exception.Message -ErrorAction Continue
    exit 2
}

# Check result
try {

    $testResult = Get-ScheduledTask -TaskName 'scvmm_test' | Get-ScheduledTaskInfo

    if ($testResult.LastTaskResult -eq 0){

        Write-Verbose "Task was successfull"
        exit 0
    }
    else {

        Write-Verbose "Task failed"
        exit 12
    }

}
catch {

    Write-Error "Unable to check result" -ErrorAction Continue
    Write-Error $_.Exception.Message -ErrorAction Continue
    exit 3
}