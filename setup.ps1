# Product Inventory Management System - Setup Script
# Run this script to install all dependencies

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Product Inventory Management System" -ForegroundColor Cyan
Write-Host "Automated Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
Write-Host "Checking Node.js installation..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js not found! Please install Node.js 16+ from https://nodejs.org" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Installing Backend Dependencies..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

Set-Location backend

if (Test-Path "node_modules") {
    Write-Host "Backend node_modules already exists. Skipping..." -ForegroundColor Yellow
} else {
    Write-Host "Running npm install in backend..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Backend dependencies installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "✗ Backend installation failed!" -ForegroundColor Red
        exit 1
    }
}

Set-Location ..

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Installing Frontend Dependencies..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

Set-Location frontend

if (Test-Path "node_modules") {
    Write-Host "Frontend node_modules already exists. Skipping..." -ForegroundColor Yellow
} else {
    Write-Host "Running npm install in frontend..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Frontend dependencies installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "✗ Frontend installation failed!" -ForegroundColor Red
        exit 1
    }
}

Set-Location ..

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✓ Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Start Backend:  cd backend && npm run dev" -ForegroundColor White
Write-Host "2. Start Frontend: cd frontend && npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "Backend will run on:  http://localhost:5000" -ForegroundColor Yellow
Write-Host "Frontend will run on: http://localhost:5173" -ForegroundColor Yellow
Write-Host ""
Write-Host "For more information, see README.md or QUICKSTART.md" -ForegroundColor Gray
Write-Host ""
