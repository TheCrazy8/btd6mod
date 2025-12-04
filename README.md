# BTD6 Chinese Skins

<h1 align="center">
<a href="https://github.com/TheCrazy8/btd6mod/releases/latest/download/BTD6Mod.dll">
    <img align="left" alt="Icon" height="90" src="Icon.png">
    <img align="right" alt="Download" height="75" src="https://raw.githubusercontent.com/gurrenm3/BTD-Mod-Helper/master/BloonsTD6%20Mod%20Helper/Resources/DownloadBtn.png">
</a>
BTD6 Chinese Skins
</h1>

Enables Chinese exclusive skins in the international version of BTD6!

This mod ports the exclusive hero skins from the Chinese edition of Bloons TD 6 to the international version. Includes a never-released Cat Sauda skin that was discovered in the game files!

[![Requires BTD6 Mod Helper](https://raw.githubusercontent.com/gurrenm3/BTD-Mod-Helper/master/banner.png)](https://github.com/gurrenm3/BTD-Mod-Helper#readme)

## Prerequisites

- **BTD6 Version 52.0**
- **MelonLoader**: Install from [MelonLoader's official site](https://melonwiki.xyz/)
- **.NET 6.0 Runtime**: Download from [Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
- **BTD6 Mod Helper**: Download from [GitHub](https://github.com/gurrenm3/BTD-Mod-Helper/releases)

## Installation

### For Users (Easy Method)

1. **Download the mod**:
   - Click the download button above or go to [Releases](https://github.com/TheCrazy8/btd6mod/releases)
   - Download the latest `BTD6Mod.dll` file
   - ⚠️ **Note**: The DLL from GitHub Actions may be a stub build. For a functional mod, you need to build it locally with BTD6 installed, or wait for a manually uploaded release.

2. **Install prerequisites** (if you haven't already):
   - **BTD6 Version 52.0** - Make sure your game is updated
   - **MelonLoader** - Install from [MelonLoader's official site](https://melonwiki.xyz/)
   - **.NET 6.0 Runtime** - Download from [Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
   - **BTD6 Mod Helper** - Download from [GitHub](https://github.com/gurrenm3/BTD-Mod-Helper/releases)

3. **Place the mod**:
   - Put `BTD6Mod.dll` in your BTD6 `Mods` folder:
   ```
   C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6\Mods
   ```

4. **Launch the game**:
   - Start BTD6 through Steam
   - The skins will be automatically unlocked when you reach the main menu!
   - Go to Heroes → Select Quincy, Psi, or Sauda → Choose the new skin

### For Developers (Build from Source)

To build a **fully functional** mod with all features:

**Quick Build (Recommended)**:
1. Make sure BTD6 is installed with MelonLoader and Mod Helper
2. Run the build script:
   - **Windows**: Double-click `build.bat` or run it from Command Prompt
   - **Linux/Mac**: Run `./build.sh` from terminal
3. The script will build the mod and copy it to your BTD6 Mods folder

**Manual Build**:
- See [BUILDING.md](BUILDING.md) for detailed build instructions
- See [BUILD_SCRIPTS.md](BUILD_SCRIPTS.md) for build script documentation
- Requires BTD6 installed with MelonLoader and Mod Helper
- GitHub Actions builds create stub DLLs only - full builds need local game references

## How It Works

- Skins are **automatically unlocked** and free to use
- No gameplay advantages - purely cosmetic
- Save game compatible - your saves work even if you remove the mod
- The mod patches the game to include Chinese edition content

**Note on Asset Bundles**: This mod requires asset bundles (3D models, textures, audio) that are not included in the repository. These must be obtained separately from the Chinese version of BTD6 or the original Chinese Skins Port mod.

## Building from Source

Want to build the mod yourself or contribute?

### Quick Build (Easy Way)

Just run the build script:

**Windows**:
```cmd
build.bat
```

**Linux/Mac/WSL**:
```bash
./build.sh
```

The scripts will:
- Check all prerequisites
- Build the mod
- Copy it to your BTD6 Mods folder
- Tell you if the build was successful

See [BUILD_SCRIPTS.md](BUILD_SCRIPTS.md) for script documentation and troubleshooting.

### Manual Build

**Requirements**: .NET 6.0 SDK, BTD6 v52.0 with MelonLoader and Mod Helper

```bash
git clone https://github.com/TheCrazy8/btd6mod.git
cd btd6mod
dotnet build --configuration Release
```

**Detailed Instructions**: See [BUILDING.md](BUILDING.md) for comprehensive build documentation.

### Important Notes

- **Functional builds** require BTD6 installed locally with game references
- **GitHub Actions** creates stub builds (~10KB) without game references
- **Full builds** are ~50-100KB and contain all mod functionality
- Update `btd6.targets` if BTD6 is not at the default Steam location

### Asset Bundles

The code references asset bundles that must be obtained separately:
- Extract from Chinese BTD6 version
- Get from original Chinese Skins Port mod  
- The bundle is named `chineseport` and contains models, textures, and audio

## Features

This mod adds **three exclusive Chinese New Year hero skins** to the international version:

### 🎯 General Quincy
- Traditional Chinese general armor
- Special Chinese-themed visuals
- Available at all hero levels (1, 3, 7, 10, 20)

### 🐉 Qinglong Psi
- Azure Dragon (Qinglong) themed skin
- Mystical Chinese dragon aesthetic
- Custom voice lines and sound effects
- Special mandala visual effects

### 🐱 Catwoman Sauda
- **Never officially released internationally!**
- Adorable cat-themed outfit
- Found in the game files but never made available
- Now playable with this mod!

## Known Issues & Limitations

- **Asset bundles not included**: The actual 3D models, textures, and audio files are not included in this repository. Users need to obtain the asset bundle separately or extract it from the Chinese version of BTD6.
- **Sauda abilities**: Some of Sauda's ability animations are not fully implemented yet.
- **Psi model**: Level 1 Psi has some minor visual artifacts that couldn't be fixed without breaking the model.

## Contributing

Contributions are welcome! If you want to:
- Add more Chinese skins
- Fix bugs or improve code
- Update for new BTD6 versions
- Improve documentation

Please open an issue or pull request!

## License

This mod is provided as-is for educational and modding purposes. 

## Credits

- [BTD6 Mod Helper](https://github.com/gurrenm3/BTD-Mod-Helper) by gurrenm3
- [MelonLoader](https://melonwiki.xyz/) by LavaGang
- Inspired by [TheMegax's Chinese Skins Port](https://github.com/TheMegax/BTD6-Chinese-Skins-Port)
- Chinese skin assets are property of Ninja Kiwi

## Disclaimer

This is an unofficial mod and is not affiliated with or endorsed by Ninja Kiwi. All game assets and content belong to their respective owners.
