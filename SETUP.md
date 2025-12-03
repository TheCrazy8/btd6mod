# BTD6Mod Setup Guide

This guide will walk you through setting up BTD6 modding from scratch.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installing MelonLoader](#installing-melonloader)
3. [Installing BTD6 Mod Helper](#installing-btd6-mod-helper)
4. [Installing BTD6Mod](#installing-btd6mod)
5. [Troubleshooting](#troubleshooting)

## Prerequisites

### Required Software

- **Bloons TD 6 v52.0** - The game must be installed (Steam version recommended)
- **.NET 6.0 Runtime** - Download from [Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
  - Get both the Desktop Runtime and the .NET Runtime
- **Visual C++ Redistributables** - Usually installed with Windows, but can be downloaded from [Microsoft](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads)

### Finding Your BTD6 Directory

**Steam (Default):**
```
C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6
```

**Epic Games (Default):**
```
C:\Program Files\Epic Games\BloonsTD6
```

To find your exact path:
1. Right-click BTD6 in Steam/Epic
2. Select "Properties" or "Manage"
3. Click "Browse Local Files" or similar

## Installing MelonLoader

MelonLoader is the mod loader that allows mods to run in Unity games like BTD6.

### Automatic Installation (Recommended)

1. Download the latest MelonLoader Installer from [MelonLoader's GitHub](https://github.com/LavaGang/MelonLoader/releases)
   - Get `MelonLoader.Installer.exe`

2. Run the installer as Administrator

3. Click "Select" and navigate to your BTD6 installation directory

4. Select `BloonsTD6.exe`

5. Click "Install" and wait for it to complete

6. You should see a success message

### Verifying MelonLoader Installation

1. Launch BTD6
2. You should see a console window appear alongside the game
3. The console should show MelonLoader initialization messages
4. If you see errors about missing .NET 6.0, install it and try again

## Installing BTD6 Mod Helper

BTD6 Mod Helper is a framework that makes modding easier and more powerful.

1. Download the latest `Btd6ModHelper.dll` from [BTD6 Mod Helper Releases](https://github.com/gurrenm3/BTD-Mod-Helper/releases)

2. Navigate to your BTD6 directory

3. Open the `Mods` folder (created by MelonLoader)
   - If it doesn't exist, launch BTD6 once with MelonLoader installed

4. Copy `Btd6ModHelper.dll` into the `Mods` folder

5. Launch BTD6 again

6. In the MelonLoader console, you should see:
   ```
   [Mod Helper] BTD Mod Helper v... loaded!
   ```

7. In the game's main menu, you should see a Mod Helper icon (gear icon)

## Installing BTD6Mod

1. Download the latest `BTD6Mod.dll` from the [Releases page](https://github.com/TheCrazy8/btd6mod/releases)

2. Place it in your BTD6 `Mods` folder:
   ```
   BloonsTD6/Mods/BTD6Mod.dll
   ```

3. Launch BTD6

4. Check the MelonLoader console for:
   ```
   [BTD6Mod] BTD6Mod loaded!
   ```

5. If you see this message, the mod is working!

## Directory Structure After Installation

Your BTD6 directory should look like this:

```
BloonsTD6/
├── MelonLoader/          (Created by MelonLoader)
│   ├── Managed/          (Game assemblies)
│   ├── MelonLoader.dll
│   └── ...
├── Mods/                 (Place all mods here)
│   ├── Btd6ModHelper.dll
│   └── BTD6Mod.dll
├── Plugins/              (MelonLoader plugins)
├── UserData/             (Mod settings and data)
├── UserLibs/             (Additional libraries)
├── BloonsTD6.exe
└── ...
```

## Troubleshooting

### "il2cpp_init detour failed"

**Solution:** Install .NET 6.0 Runtime
- Download from [Microsoft .NET 6.0](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
- Install both Desktop Runtime and .NET Runtime
- Restart your computer
- Try launching BTD6 again

### MelonLoader Console Doesn't Appear

**Solution:**
1. Verify MelonLoader installation by checking for `MelonLoader` folder in BTD6 directory
2. Re-run MelonLoader installer
3. Make sure you're launching `BloonsTD6.exe` directly, not through Steam/Epic
4. Check Windows security settings - sometimes antivirus blocks MelonLoader

### Mod Helper Not Loading

**Solution:**
1. Verify `Btd6ModHelper.dll` is in the `Mods` folder
2. Check the MelonLoader console for error messages
3. Ensure you're using the latest version compatible with BTD6 v52
4. Try re-downloading the DLL

### BTD6Mod Not Loading

**Solution:**
1. Verify `BTD6Mod.dll` is in the `Mods` folder
2. Make sure BTD6 Mod Helper loaded first (check console)
3. Check for error messages in the MelonLoader console
4. Verify game version is 52.0

### Game Crashes on Startup

**Solution:**
1. Remove all mods from the `Mods` folder
2. Launch BTD6 to verify it works without mods
3. Add back `Btd6ModHelper.dll` only
4. Launch and verify it works
5. Add back other mods one at a time to identify the problematic mod
6. Check for mod compatibility issues

### Mods Don't Work in Co-op/Online

**Important:** Using mods in online/co-op modes may:
- Get your account flagged or banned
- Cause desyncs and crashes
- Be considered cheating

**Recommendation:** Create a separate profile for modded play or play offline only.

### Getting More Help

- Check the [MelonLoader Wiki](https://melonwiki.xyz/)
- Visit the [BTD6 Mod Helper GitHub](https://github.com/gurrenm3/BTD-Mod-Helper)
- Join BTD6 modding communities on Discord
- Review the MelonLoader console output for specific error messages

## Development Setup

If you want to create your own mods, see [CONTRIBUTING.md](CONTRIBUTING.md) for development setup instructions.

## Updating

When BTD6 updates:
1. Wait for MelonLoader to update for the new version
2. Wait for BTD6 Mod Helper to update
3. Check if BTD6Mod needs an update
4. Always backup your save data before updating

## Uninstalling

To remove mods:
1. Delete all `.dll` files from the `Mods` folder
2. Launch BTD6 normally

To remove MelonLoader:
1. Delete the `MelonLoader` folder
2. Delete `version.dll` from the BTD6 directory
3. Verify game files through Steam/Epic

---

**Reminder:** Modding is done at your own risk. Always backup your game saves and be aware that mods may violate the game's terms of service.
