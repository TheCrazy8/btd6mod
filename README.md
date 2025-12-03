# BTD6Mod

<h1 align="center">
<a href="https://github.com/TheCrazy8/btd6mod/releases/latest/download/BTD6Mod.dll">
    <img align="left" alt="Icon" height="90" src="Icon.png">
    <img align="right" alt="Download" height="75" src="https://raw.githubusercontent.com/gurrenm3/BTD-Mod-Helper/master/BloonsTD6%20Mod%20Helper/Resources/DownloadBtn.png">
</a>
BTD6Mod
</h1>

A BTD6 v52 mod skeleton using MelonLoader and BTD6 Mod Helper.

[![Requires BTD6 Mod Helper](https://raw.githubusercontent.com/gurrenm3/BTD-Mod-Helper/master/banner.png)](https://github.com/gurrenm3/BTD-Mod-Helper#readme)

## Prerequisites

- **BTD6 Version 52.0**
- **MelonLoader**: Install from [MelonLoader's official site](https://melonwiki.xyz/)
- **.NET 6.0 Runtime**: Download from [Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
- **BTD6 Mod Helper**: Download from [GitHub](https://github.com/gurrenm3/BTD-Mod-Helper/releases)

## Installation

1. Install MelonLoader by running the installer on your BTD6 game directory:
   ```
   C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6
   ```

2. Place `Btd6ModHelper.dll` in the `Mods` folder inside your BTD6 directory

3. Download the latest `BTD6Mod.dll` from [Releases](https://github.com/TheCrazy8/btd6mod/releases) and place it in the `Mods` folder

4. Launch BTD6 and verify the mod loads in the MelonLoader console

## Development

This project uses:
- .NET 6.0
- C# with preview language features
- BTD6 Mod Helper API

To build the mod:
1. Clone this repository
2. Open `BTD6Mod.sln` in Visual Studio or Rider
3. Set up your `btd6.targets` file (see [BTD6 Mod Helper documentation](https://github.com/gurrenm3/BTD-Mod-Helper))
4. Build the solution

The compiled DLL will be placed in the `bin/Debug/net6.0/` or `bin/Release/net6.0/` folder.

## Features

This is a skeleton mod that:
- Loads successfully with BTD6 v52
- Uses BTD6 Mod Helper API
- Includes GitHub Actions for automated builds
- Ready to be extended with custom functionality

## Extending the Mod

Override additional methods in the `BTD6Mod` class:
- `OnUpdate()` - Called every frame
- `OnMainMenu()` - Called when the main menu loads
- `OnTitleScreen()` - Called when the title screen loads
- And many more hooks provided by BTD6 Mod Helper

## License

This mod skeleton is provided as-is for educational and modding purposes.

## Credits

- [BTD6 Mod Helper](https://github.com/gurrenm3/BTD-Mod-Helper) by gurrenm3
- [MelonLoader](https://melonwiki.xyz/) by LavaGang
- Template based on [doombubbles' template-mod](https://github.com/doombubbles/btd6-template-mod)
