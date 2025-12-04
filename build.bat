@echo off
REM Build script for BTD6 Chinese Skins Mod (Windows)
REM This script builds the mod with all game references

echo ========================================
echo BTD6 Chinese Skins Mod - Build Script
echo ========================================
echo.

REM Check if .NET SDK is installed
where dotnet >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: .NET SDK not found!
    echo Please install .NET 6.0 SDK from: https://dotnet.microsoft.com/download/dotnet/6.0
    echo.
    pause
    exit /b 1
)

echo Checking .NET version...
dotnet --version
echo.

REM Check if BTD6 is installed
set "BTD6_PATH=C:\Program Files (x86)\Steam\steamapps\common\BloonsTD6"
if not exist "%BTD6_PATH%\BloonsTD6.exe" (
    echo WARNING: BTD6 not found at default location:
    echo "%BTD6_PATH%"
    echo.
    echo If BTD6 is installed elsewhere, edit btd6.targets and update the path.
    echo.
    set /p CONTINUE="Continue anyway? (y/n): "
    if /i not "%CONTINUE%"=="y" exit /b 1
)

REM Check if MelonLoader is installed
if not exist "%BTD6_PATH%\MelonLoader\MelonLoader.dll" (
    echo WARNING: MelonLoader not found in BTD6 directory!
    echo Please install MelonLoader from: https://melonwiki.xyz/
    echo.
    set /p CONTINUE="Continue anyway? (y/n): "
    if /i not "%CONTINUE%"=="y" exit /b 1
)

REM Check if BTD6 Mod Helper is installed
if not exist "%BTD6_PATH%\Mods\Btd6ModHelper.dll" (
    echo WARNING: BTD6 Mod Helper not found in Mods folder!
    echo Please install it from: https://github.com/gurrenm3/BTD-Mod-Helper/releases
    echo.
    set /p CONTINUE="Continue anyway? (y/n): "
    if /i not "%CONTINUE%"=="y" exit /b 1
)

echo ========================================
echo Building mod...
echo ========================================
echo.

REM Clean previous builds
echo Cleaning previous builds...
dotnet clean --configuration Release
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Clean failed!
    pause
    exit /b 1
)
echo.

REM Restore dependencies
echo Restoring dependencies...
dotnet restore
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Restore failed!
    pause
    exit /b 1
)
echo.

REM Build the project
echo Building Release configuration...
dotnet build --configuration Release --no-restore
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ========================================
    echo BUILD FAILED!
    echo ========================================
    echo.
    echo This usually means game references are not available.
    echo Make sure BTD6 is installed with MelonLoader and Mod Helper.
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo BUILD SUCCESSFUL!
echo ========================================
echo.

REM Check if the DLL was created
if exist "bin\Release\net6.0\BTD6Mod.dll" (
    echo Output DLL: bin\Release\net6.0\BTD6Mod.dll
    
    REM Get file size
    for %%A in ("bin\Release\net6.0\BTD6Mod.dll") do set size=%%~zA
    set /a sizeKB=%size%/1024
    echo DLL Size: %sizeKB% KB
    echo.
    
    REM Check if it's a stub build
    if %sizeKB% LSS 20 (
        echo WARNING: DLL size is very small ^(%sizeKB% KB^)!
        echo This is likely a STUB BUILD without game references.
        echo The mod will NOT work in-game.
        echo.
        echo Make sure BTD6 is installed with MelonLoader and Mod Helper.
        echo.
    ) else (
        echo This appears to be a FUNCTIONAL BUILD! ^(%sizeKB% KB^)
        echo.
        
        REM Check if it was copied to Mods folder
        if exist "%BTD6_PATH%\Mods\BTD6Mod.dll" (
            echo DLL was automatically copied to: "%BTD6_PATH%\Mods\"
            echo You can now launch BTD6 to use the mod!
        ) else (
            echo DLL was NOT copied to Mods folder automatically.
            echo You can manually copy it from: bin\Release\net6.0\BTD6Mod.dll
            echo To: "%BTD6_PATH%\Mods\"
        )
    )
) else (
    echo ERROR: Output DLL not found!
    echo Expected: bin\Release\net6.0\BTD6Mod.dll
)

echo.
echo ========================================
echo Build complete!
echo ========================================
echo.
pause
