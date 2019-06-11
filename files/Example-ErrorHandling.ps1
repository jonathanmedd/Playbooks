#Requires -RunAsAdministrator
$ErrorActionPreference ='Stop'

# Start Scheduled Task
try {
    Get-Service "This will fail"
}
catch {

    Write-Error "Unable find service" -ErrorAction Continue
    Write-Error $_.Exception.Message -ErrorAction Continue
    exit 1
}
