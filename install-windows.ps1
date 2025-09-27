# MeCOGO Windows PowerShell Installer
# Run this script as Administrator

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "MeCOGO - Windows Installation Script" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires Administrator privileges." -ForegroundColor Red
    Write-Host "Please right-click and 'Run as Administrator'" -ForegroundColor Yellow
    pause
    exit 1
}

# Function to check if a command exists
function Test-Command($command) {
    try {
        Get-Command $command -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

# Check and install Node.js
Write-Host "Checking Node.js installation..." -ForegroundColor Yellow
if (Test-Command "node") {
    $nodeVersion = node --version
    Write-Host "✅ Node.js found: $nodeVersion" -ForegroundColor Green
} else {
    Write-Host "❌ Node.js not found. Installing..." -ForegroundColor Red
    
    # Download and install Node.js
    $nodeUrl = "https://nodejs.org/dist/v18.17.0/node-v18.17.0-x64.msi"
    $nodeInstaller = "$env:TEMP\nodejs-installer.msi"
    
    Write-Host "Downloading Node.js..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $nodeUrl -OutFile $nodeInstaller
    
    Write-Host "Installing Node.js..." -ForegroundColor Yellow
    Start-Process msiexec.exe -Wait -ArgumentList "/i $nodeInstaller /quiet"
    
    Remove-Item $nodeInstaller
    
    # Refresh PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    Write-Host "✅ Node.js installed successfully!" -ForegroundColor Green
}

# Check and install Yarn
Write-Host "Checking Yarn installation..." -ForegroundColor Yellow
if (Test-Command "yarn") {
    $yarnVersion = yarn --version
    Write-Host "✅ Yarn found: $yarnVersion" -ForegroundColor Green
} else {
    Write-Host "Installing Yarn..." -ForegroundColor Yellow
    npm install -g yarn
    Write-Host "✅ Yarn installed successfully!" -ForegroundColor Green
}

# Install MeCOGO dependencies
Write-Host "Installing MeCOGO dependencies..." -ForegroundColor Yellow
yarn install

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ MeCOGO installation completed successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ Installation failed. Please check the errors above." -ForegroundColor Red
    pause
    exit 1
}

# Create desktop shortcut
Write-Host "Creating desktop shortcut..." -ForegroundColor Yellow
$desktopPath = [Environment]::GetFolderPath("Desktop")
$shortcutPath = "$desktopPath\MeCOGO.lnk"
$targetPath = "$PWD\start-mecogo.bat"

$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $targetPath
$shortcut.WorkingDirectory = $PWD
$shortcut.IconLocation = "$PWD\public\favicon.ico"
$shortcut.Description = "MeCOGO - Goal Mapping & Accountability Tracker"
$shortcut.Save()

Write-Host "✅ Desktop shortcut created!" -ForegroundColor Green

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "Installation Complete!" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To start MeCOGO:" -ForegroundColor Yellow
Write-Host "1. Double-click the 'MeCOGO' shortcut on your desktop" -ForegroundColor White
Write-Host "2. Or double-click 'start-mecogo.bat' in this folder" -ForegroundColor White
Write-Host "3. MeCOGO will open automatically in your browser" -ForegroundColor White
Write-Host ""
Write-Host "Demo login: demo@mecogo.app / demo123" -ForegroundColor Cyan
Write-Host ""
pause
