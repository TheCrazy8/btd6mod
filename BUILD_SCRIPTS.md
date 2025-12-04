# Quick Build Guide

## For Windows Users

1. Open Command Prompt or PowerShell in the project directory
2. Run the build script:
   ```cmd
   build.bat
   ```
3. The script will:
   - Check for .NET SDK, BTD6, MelonLoader, and Mod Helper
   - Build the mod
   - Automatically copy it to your BTD6 Mods folder
   - Tell you if the build was successful

## For Linux/Mac/WSL Users

1. Open a terminal in the project directory
2. Run the build script:
   ```bash
   ./build.sh
   ```
3. The script will:
   - Check for .NET SDK and BTD6 installation
   - Build the mod
   - Attempt to copy it to your BTD6 Mods folder
   - Provide instructions based on your platform

## What the Scripts Check

✅ .NET 6.0 SDK is installed  
✅ BTD6 is installed at the default location  
✅ MelonLoader is installed in BTD6  
✅ BTD6 Mod Helper is in the Mods folder  
✅ Build completes successfully  
✅ Output DLL size (to detect stub vs functional builds)  

## Build Output

The compiled mod will be at:
```
bin/Release/net6.0/BTD6Mod.dll
```

**Functional build**: ~50-100 KB - Contains all mod functionality  
**Stub build**: ~10 KB - Only metadata, won't work in-game

## Troubleshooting

### "ERROR: .NET SDK not found"
Install .NET 6.0 SDK from: https://dotnet.microsoft.com/download/dotnet/6.0

### "WARNING: BTD6 not found"
Edit `btd6.targets` file and update line 4 with your BTD6 installation path:
```xml
<BloonsTD6>YOUR_BTD6_PATH_HERE</BloonsTD6>
```

### "WARNING: This is likely a STUB BUILD"
The build succeeded but game references weren't found. This means:
- BTD6 isn't at the expected location
- MelonLoader isn't installed
- BTD6 Mod Helper isn't installed

Update `btd6.targets` with the correct path and ensure MelonLoader and Mod Helper are installed.

### Build fails with errors
- Make sure BTD6, MelonLoader, and Mod Helper are installed
- Check that btd6.targets points to the correct BTD6 directory
- Try closing BTD6 if it's running (file locks)

## Manual Build (Advanced)

If the scripts don't work, you can build manually:

```bash
# Clean
dotnet clean --configuration Release

# Restore
dotnet restore

# Build
dotnet build --configuration Release
```

The output will be in `bin/Release/net6.0/BTD6Mod.dll`

## Need Help?

See [BUILDING.md](BUILDING.md) for comprehensive build documentation.
