# Contributing to BTD6Mod

Thank you for your interest in contributing to BTD6Mod!

## Development Setup

### Prerequisites

1. **Visual Studio 2022** or **JetBrains Rider** with .NET 6.0 support
2. **BTD6 Version 52.0** installed
3. **MelonLoader** installed in your BTD6 directory
4. **BTD6 Mod Helper** DLL in your Mods folder

### Setting Up Your Development Environment

1. Clone this repository:
   ```bash
   git clone https://github.com/TheCrazy8/btd6mod.git
   cd btd6mod
   ```

2. Edit the `btd6.targets` file and update the `BloonsTD6` path to match your installation:
   ```xml
   <BloonsTD6>C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6</BloonsTD6>
   ```

3. Open `BTD6Mod.sln` in Visual Studio or Rider

4. Build the solution (Ctrl+Shift+B in Visual Studio)

5. The compiled DLL will automatically be copied to your Mods folder if the path is configured correctly

### Project Structure

```
btd6mod/
├── .github/
│   └── workflows/
│       └── build.yml          # GitHub Actions CI/CD
├── Properties/
│   └── AssemblyInfo.cs        # Assembly metadata
├── BTD6Mod.cs                 # Main mod class
├── ModHelperData.cs           # Mod metadata and configuration
├── BTD6Mod.csproj             # Project file
├── BTD6Mod.sln                # Solution file
├── btd6.targets               # Build targets and references
├── LATEST.md                  # Release notes for latest version
└── README.md                  # Project documentation
```

## Making Changes

### Adding New Features

1. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Implement your changes in the appropriate files

3. Test your changes by building and running BTD6 with MelonLoader

4. Commit your changes with clear, descriptive messages:
   ```bash
   git commit -m "Add feature: description of your feature"
   ```

5. Push your branch and create a pull request

### Common Development Tasks

#### Adding a New Tower Modification

Override the appropriate hook in `BTD6Mod.cs`:

```csharp
public override void OnTowerCreated(Tower tower, Entity target, Model modelToUse)
{
    // Your tower modification code here
}
```

#### Adding Menu Items

Use BTD6 Mod Helper's menu system:

```csharp
public override void OnMainMenu()
{
    // Add your menu items
}
```

#### Logging and Debugging

Use MelonLoader's logging system:

```csharp
ModHelper.Msg<BTD6Mod>("Your debug message here");
ModHelper.Warning<BTD6Mod>("Warning message");
ModHelper.Error<BTD6Mod>("Error message");
```

### Code Style Guidelines

- Use C# 10+ features when appropriate
- Follow Microsoft's C# coding conventions
- Use meaningful variable and method names
- Add XML documentation comments for public APIs
- Keep methods focused and concise

### Testing

1. Build the mod in Debug configuration
2. Launch BTD6 with MelonLoader
3. Check the MelonLoader console for any errors
4. Test your changes in-game
5. Verify no crashes or unexpected behavior

### Building for Release

1. Update the version in `ModHelperData.cs`:
   ```csharp
   public const string Version = "1.1.0";
   ```

2. Update `LATEST.md` with release notes

3. Build in Release configuration:
   ```bash
   dotnet build --configuration Release
   ```

4. Test the Release build thoroughly

5. Create a tag and push to trigger automated release:
   ```bash
   git tag v1.1.0
   git push origin v1.1.0
   ```

## Submitting Pull Requests

1. Ensure your code builds without errors
2. Test your changes thoroughly
3. Update documentation if needed
4. Create a pull request with a clear description of your changes
5. Reference any related issues

## Getting Help

- Check the [BTD6 Mod Helper documentation](https://github.com/gurrenm3/BTD-Mod-Helper)
- Review existing mods in the [BTD6 modding community](https://github.com/topics/btd6-mod)
- Ask questions in the BTD6 modding Discord communities

## License and Legal

- Respect Ninja Kiwi's intellectual property
- Do not distribute game assets
- Use mods responsibly and at your own risk
- Modding may affect your online play or account standing

Thank you for contributing!
