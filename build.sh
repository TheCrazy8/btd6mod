#!/bin/bash

# Build script for BTD6 Chinese Skins Mod (Linux/Mac/WSL)
# This script builds the mod with all game references

set -e  # Exit on error

echo "========================================"
echo "BTD6 Chinese Skins Mod - Build Script"
echo "========================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if .NET SDK is installed
if ! command -v dotnet &> /dev/null; then
    echo -e "${RED}ERROR: .NET SDK not found!${NC}"
    echo "Please install .NET 6.0 SDK from: https://dotnet.microsoft.com/download/dotnet/6.0"
    exit 1
fi

echo "Checking .NET version..."
dotnet --version
echo ""

# Note about Wine/Proton for Linux users
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo -e "${YELLOW}Note for Linux users:${NC}"
    echo "BTD6 on Linux typically runs through Steam Proton/Wine."
    echo "Make sure to update the path in btd6.targets to your Proton/Wine prefix."
    echo "Example: ~/.steam/steam/steamapps/compatdata/960090/pfx/drive_c/Program Files (x86)/Steam/steamapps/common/BloonsTD6"
    echo ""
fi

# Default BTD6 paths for different platforms
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac
    BTD6_PATH="$HOME/Library/Application Support/Steam/steamapps/common/BloonsTD6"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux - check common locations
    if [ -d "$HOME/.steam/steam/steamapps/common/BloonsTD6" ]; then
        BTD6_PATH="$HOME/.steam/steam/steamapps/common/BloonsTD6"
    elif [ -d "$HOME/.local/share/Steam/steamapps/common/BloonsTD6" ]; then
        BTD6_PATH="$HOME/.local/share/Steam/steamapps/common/BloonsTD6"
    else
        BTD6_PATH=""
    fi
else
    # WSL or other - use Windows path
    BTD6_PATH="/mnt/c/Program Files (x86)/Steam/steamapps/common/BloonsTD6"
fi

# Check BTD6 installation
if [ -n "$BTD6_PATH" ] && [ ! -d "$BTD6_PATH" ]; then
    echo -e "${YELLOW}WARNING: BTD6 not found at: $BTD6_PATH${NC}"
    echo "If BTD6 is installed elsewhere, edit btd6.targets and update the path."
    echo ""
    read -p "Continue anyway? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "========================================"
echo "Building mod..."
echo "========================================"
echo ""

# Clean previous builds
echo "Cleaning previous builds..."
dotnet clean --configuration Release
echo ""

# Restore dependencies
echo "Restoring dependencies..."
dotnet restore
echo ""

# Build the project
echo "Building Release configuration..."
if dotnet build --configuration Release --no-restore; then
    echo ""
    echo -e "${GREEN}========================================"
    echo "BUILD SUCCESSFUL!"
    echo "========================================${NC}"
    echo ""
    
    # Check if the DLL was created
    if [ -f "bin/Release/net6.0/BTD6Mod.dll" ]; then
        echo "Output DLL: bin/Release/net6.0/BTD6Mod.dll"
        
        # Get file size
        size=$(stat -f%z "bin/Release/net6.0/BTD6Mod.dll" 2>/dev/null || stat -c%s "bin/Release/net6.0/BTD6Mod.dll" 2>/dev/null)
        sizeKB=$((size / 1024))
        echo "DLL Size: ${sizeKB} KB"
        echo ""
        
        # Check if it's a stub build
        if [ $sizeKB -lt 20 ]; then
            echo -e "${YELLOW}WARNING: DLL size is very small (${sizeKB} KB)!${NC}"
            echo "This is likely a STUB BUILD without game references."
            echo "The mod will NOT work in-game."
            echo ""
            echo "Make sure BTD6 is installed with MelonLoader and Mod Helper."
            echo "Update the path in btd6.targets if BTD6 is in a different location."
            echo ""
        else
            echo -e "${GREEN}This appears to be a FUNCTIONAL BUILD! (${sizeKB} KB)${NC}"
            echo ""
            
            # Check if it was copied to Mods folder
            if [ -n "$BTD6_PATH" ] && [ -f "$BTD6_PATH/Mods/BTD6Mod.dll" ]; then
                echo "DLL was automatically copied to: $BTD6_PATH/Mods/"
                echo "You can now launch BTD6 to use the mod!"
            else
                echo "DLL location: bin/Release/net6.0/BTD6Mod.dll"
                if [ -n "$BTD6_PATH" ]; then
                    echo "Copy it to: $BTD6_PATH/Mods/"
                else
                    echo "Copy it to your BTD6 Mods folder"
                fi
            fi
        fi
    else
        echo -e "${RED}ERROR: Output DLL not found!${NC}"
        echo "Expected: bin/Release/net6.0/BTD6Mod.dll"
    fi
else
    echo ""
    echo -e "${RED}========================================"
    echo "BUILD FAILED!"
    echo "========================================${NC}"
    echo ""
    echo "This usually means game references are not available."
    echo "Make sure BTD6 is installed with MelonLoader and Mod Helper."
    echo "Update the path in btd6.targets if needed."
    exit 1
fi

echo ""
echo "========================================"
echo "Build complete!"
echo "========================================"
