# Building the BTD6 Chinese Skins Mod

This guide explains how to build the mod from source.

## Two Types of Builds

### 1. CI Build (Automated via GitHub Actions)
- **What it does**: Creates a minimal stub DLL that contains only metadata
- **When**: Automatically runs on every push to GitHub
- **Purpose**: Validates the code compiles and creates placeholder releases
- **Limitation**: This build **does NOT include the actual mod functionality** because it lacks game references

### 2. Full Build (Local Development)
- **What it does**: Creates a fully functional mod DLL with all Chinese skins
- **When**: Built locally on your machine
- **Purpose**: Create a working mod that can be used in-game
- **Requirement**: BTD6 must be installed with MelonLoader and BTD6 Mod Helper

## Prerequisites for Full Build

1. **Bloons TD 6** installed (Steam version recommended)
   - Default path: `C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6`

2. **MelonLoader** installed in BTD6
   - Download from: https://melonwiki.xyz/
   - Run the installer and point it to your BTD6 directory

3. **BTD6 Mod Helper** installed
   - Download latest from: https://github.com/gurrenm3/BTD-Mod-Helper/releases
   - Place `Btd6ModHelper.dll` in `<BTD6 Directory>/Mods/`

4. **.NET 6.0 SDK**
   - Download from: https://dotnet.microsoft.com/download/dotnet/6.0

5. **IDE** (optional but recommended)
   - Visual Studio 2022 or later
   - JetBrains Rider
   - Visual Studio Code with C# extension

## Building Steps

### Option A: Using Visual Studio / Rider

1. Open `BTD6Mod.sln` in your IDE
2. Make sure your BTD6 installation path is correct in `btd6.targets` (line 4)
3. Build the solution (Ctrl+Shift+B in Visual Studio)
4. The mod DLL will be automatically copied to your BTD6 `Mods` folder

### Option B: Using Command Line

1. Clone the repository:
   ```bash
   git clone https://github.com/TheCrazy8/btd6mod.git
   cd btd6mod
   ```

2. Verify your BTD6 path in `btd6.targets`:
   ```xml
   <BloonsTD6>C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6</BloonsTD6>
   ```

3. Build the project:
   ```bash
   dotnet build --configuration Release
   ```

4. The compiled DLL will be at:
   ```
   bin/Release/net6.0/BTD6Mod.dll
   ```

5. It will also be automatically copied to your BTD6 Mods folder

## Verifying the Build

### Check if Build is Functional

A **functional build** will be around 50-100KB and includes:
- All skin data and configurations
- Display classes for Quincy, Psi, and Sauda
- Save game compatibility patches

A **stub build** will be around 10KB and only contains metadata.

### Testing the Mod

1. Launch BTD6 through Steam
2. Check the MelonLoader console for:
   ```
   [BTD6 Chinese Skins] BTD6 Chinese Skins loaded!
   ```
3. Go to the main menu
4. Select Heroes → Pick Quincy, Psi, or Sauda
5. You should see the new Chinese skins available

## Troubleshooting

### "Unable to find game references"
- Make sure BTD6 is installed at the path specified in `btd6.targets`
- Verify MelonLoader is installed (`<BTD6>/MelonLoader/MelonLoader.dll` exists)
- Check that BTD6 Mod Helper is in `<BTD6>/Mods/Btd6ModHelper.dll`

### "Build succeeded but mod doesn't work"
- You might have built the stub version
- Ensure `GameReferencesAvailable` is `true` during build
- Check the DLL size - should be 50KB+, not 10KB

### DLL not copied to Mods folder
- Check that the Mods folder exists
- Verify you have write permissions
- Manually copy from `bin/Release/net6.0/BTD6Mod.dll` to your Mods folder

## Asset Bundles

**Important**: This repository contains the C# code but **NOT the asset bundles** (3D models, textures, audio).

The code references an asset bundle named `chineseport` that must be obtained separately:
- Extract from the Chinese version of BTD6
- Obtain from the original Chinese Skins Port mod
- Create your own from BTD6 assets

The asset bundle should be placed in the mod's resource folder during packaging.

## GitHub Actions Build

The GitHub Actions workflow creates releases automatically but with limitations:
- ✅ Validates code compiles
- ✅ Creates tagged releases
- ✅ Uploads DLL to releases
- ❌ DLL is a stub without game references
- ❌ Not functional for actual gameplay

For a **functional release**, you must:
1. Build locally with BTD6 installed
2. Manually upload the functional DLL to the GitHub release
3. Or set up GitHub Actions with game DLLs (not recommended due to licensing)

## Development Tips

- Keep BTD6 closed while building to avoid file locks
- Use `Debug` configuration for development with symbols
- Use `Release` configuration for distribution (smaller, optimized)
- Changes are automatically copied to Mods folder on successful build
- Restart BTD6 to load the updated mod

## Contributing

When contributing code:
1. Make sure it builds locally with game references
2. Test in-game before submitting PR
3. Don't include game DLLs or asset bundles in commits
4. Update this documentation if you change build process
