$ErrorActionPreference = "Stop"

###############################################################
# Scoop & Steam Installation Script
# This script automates the installation of Scoop and Steam.
# Make sure to run it in 'PowerShell ISE (x86)'.
###############################################################

# Step 1: Open PowerShell ISE (x86) manually before running this script
Write-Host "Step 1: Ensure you are running 'PowerShell ISE (x86)'" -ForegroundColor Cyan

# Step 2: Run Git installation in a separate PowerShell window
Write-Host "Step 2: Running Git installation in a separate PowerShell window..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "winget install --id Git.Git -e --source winget" -NoNewWindow -Wait
Write-Host "Git installation initiated in a separate PowerShell window." -ForegroundColor Green

# Step 3: Navigate to C:\Scoop directory and clone the Scoop repository
Write-Host "Step 3: Navigating to C:\Scoop and cloning Scoop repository..." -ForegroundColor Cyan
$scoopPath = "C:\Scoop"

if (Test-Path $scoopPath) {
    Write-Host "Existing Scoop folder detected. Removing it..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $scoopPath
}

Set-Location -Path "C:\"  # Navigate to C:\
# Set GIT_REDIRECT_STDERR environment variable to ignore Git errors
$env:GIT_REDIRECT_STDERR = "2>&1"
git clone https://github.com/ScoopInstaller/Scoop Scoop
Write-Host "Scoop repository cloned successfully." -ForegroundColor Green

# Step 4: Change directory to Scoop folder
Write-Host "Step 4: Navigating to Scoop folder..." -ForegroundColor Cyan
Set-Location -Path $scoopPath

# Step 5: Check if Scoop is installed, if so, update it
Write-Host "Step 5: Setting execution policy and installing/updating Scoop..." -ForegroundColor Cyan
if (Test-Path "$scoopPath\bin\scoop.ps1") {
    Write-Host "Scoop is already installed. Running 'scoop update'..." -ForegroundColor Yellow
    scoop update
} else {
    Write-Host "Scoop is not installed. Installing Scoop..." -ForegroundColor Yellow
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
    Write-Host "Scoop installed successfully." -ForegroundColor Green
}

# Step 6: Install Git via Scoop
Write-Host "Step 6: Installing Git via Scoop..." -ForegroundColor Cyan
scoop install git
Write-Host "Git installed successfully via Scoop." -ForegroundColor Green

# Step 7: Add the versions bucket
Write-Host "Step 7: Adding 'versions' bucket to Scoop..." -ForegroundColor Cyan
scoop bucket add versions
Write-Host "Bucket added successfully." -ForegroundColor Green

# Step 8: Copy steam.json file
Write-Host "Step 8: Copying steam.json file..." -ForegroundColor Cyan
$steamJsonSource = "G:\STEAM_INSTALL\steam.json"
$steamJsonDest = "C:\Users\$env:USERNAME\scoop\buckets\versions\bucket\steam.json"
if (Test-Path $steamJsonSource) {
    Copy-Item -Path $steamJsonSource -Destination $steamJsonDest -Force
    Write-Host "steam.json file copied successfully." -ForegroundColor Green
} else {
    Write-Host "steam.json source file not found!" -ForegroundColor Red
}

# Step 9: Copy steam.zip to XAMPP directory
Write-Host "Step 9: Copying steam.zip file..." -ForegroundColor Cyan
$steamZipSource = "G:\STEAM_INSTALL\steam\steam.zip"
$steamZipDest = "C:\xampp\htdocs\steam\steam.zip"
if (Test-Path $steamZipSource) {
    Copy-Item -Path $steamZipSource -Destination $steamZipDest -Force
    Write-Host "steam.zip file copied successfully." -ForegroundColor Green
} else {
    Write-Host "steam.zip source file not found!" -ForegroundColor Red
}

# Step 10: Start XAMPP
Write-Host "Step 10: Starting XAMPP..." -ForegroundColor Cyan
$xamppPath = "C:\xampp\xampp-control.exe"

if (Test-Path $xamppPath) {
    Start-Process $xamppPath
    Write-Host "XAMPP started successfully." -ForegroundColor Green
} else {
    Write-Host "XAMPP control panel not found at $xamppPath!" -ForegroundColor Red
}

# Step 11: Install Steam using Scoop
Write-Host "Step 11: Installing Steam via Scoop..." -ForegroundColor Cyan
scoop install steam
Write-Host "Steam installed successfully." -ForegroundColor Green

Write-Host "Installation process completed." -ForegroundColor Magenta
