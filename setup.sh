#!/bin/bash

# Product Inventory Management System - Setup Script
# Run this script to install all dependencies

echo "========================================"
echo "Product Inventory Management System"
echo "Automated Setup Script"
echo "========================================"
echo ""

# Check if Node.js is installed
echo "Checking Node.js installation..."
if command -v node &> /dev/null
then
    NODE_VERSION=$(node --version)
    echo "✓ Node.js found: $NODE_VERSION"
else
    echo "✗ Node.js not found! Please install Node.js 16+ from https://nodejs.org"
    exit 1
fi

echo ""
echo "========================================"
echo "Installing Backend Dependencies..."
echo "========================================"

cd backend

if [ -d "node_modules" ]; then
    echo "Backend node_modules already exists. Skipping..."
else
    echo "Running npm install in backend..."
    npm install
    if [ $? -eq 0 ]; then
        echo "✓ Backend dependencies installed successfully!"
    else
        echo "✗ Backend installation failed!"
        exit 1
    fi
fi

cd ..

echo ""
echo "========================================"
echo "Installing Frontend Dependencies..."
echo "========================================"

cd frontend

if [ -d "node_modules" ]; then
    echo "Frontend node_modules already exists. Skipping..."
else
    echo "Running npm install in frontend..."
    npm install
    if [ $? -eq 0 ]; then
        echo "✓ Frontend dependencies installed successfully!"
    else
        echo "✗ Frontend installation failed!"
        exit 1
    fi
fi

cd ..

echo ""
echo "========================================"
echo "✓ Setup Complete!"
echo "========================================"
echo ""
echo "Next Steps:"
echo "1. Start Backend:  cd backend && npm run dev"
echo "2. Start Frontend: cd frontend && npm run dev"
echo ""
echo "Backend will run on:  http://localhost:5000"
echo "Frontend will run on: http://localhost:5173"
echo ""
echo "For more information, see README.md or QUICKSTART.md"
echo ""
