# Known Issues and Limitations

This document tracks known issues, limitations, and future improvements for the BTD6 Chinese Skins mod.

## Current Limitations

### 1. Asset Bundles Not Included
**Status**: By Design  
**Description**: The repository does not include the actual 3D models, textures, and audio files.

**Why**: These assets are:
- Proprietary to Ninja Kiwi
- Large binary files not suitable for Git
- Available in the Chinese version of BTD6

**Workaround**: Users must obtain the `chineseport` asset bundle separately by:
- Extracting from the Chinese version of BTD6
- Getting from the original Chinese Skins Port mod
- Creating custom asset bundles from BTD6 assets

### 2. Sauda Ability Animations Incomplete
**Status**: Known Issue  
**Severity**: Minor - Visual Only  
**Description**: Some of Sauda's ability animations haven't been fully implemented.

**Impact**: 
- Abilities work functionally
- Visual animations may not match the Chinese version perfectly
- No gameplay impact

**TODO**: Find a way to implement the remaining ability animations without breaking existing functionality.

### 3. Psi Level 1 Visual Artifacts
**Status**: Known Issue  
**Severity**: Cosmetic  
**Description**: Psi's level 1 head model has some minor polygon artifacts.

**Impact**:
- Slight visual glitches on level 1 Psi
- Not noticeable during normal gameplay
- No functional issues

**TODO**: Find a way to modify the model to remove artifacts without breaking the model structure.

### 4. CI Builds Create Stub DLLs
**Status**: By Design  
**Description**: GitHub Actions builds create ~10KB stub DLLs without actual mod functionality.

**Why**: 
- CI environment doesn't have BTD6 installed
- Game DLLs cannot be included in repository
- No public NuGet packages available for BTD6 dependencies

**Solution**: Users must build locally with BTD6 installed, or download manually uploaded functional builds.

## Design Decisions

### Model Reuse: Quincy Level 1 = Level 3
**File**: `Displays/Quincy/NewYearQuincyLevel1.cs`  
**Reason**: The level 1 and level 3 models in the Chinese version are identical.  
**Implementation**: Level 1 display class references the level 3 prefab to avoid duplication.

### Save Game Compatibility Approach
**File**: `SavePatch.cs`  
**Design**: Uses Harmony patches to clean mod data before saving, then restore after.  
**Why**: Ensures saves work even if the mod is removed, preventing save corruption.  
**Trade-off**: Slightly more complex than direct save modification, but much safer.

## Future Improvements

### Short Term
- [ ] Document how to create/obtain asset bundles
- [ ] Add automated tests for save compatibility
- [ ] Improve build script error messages
- [ ] Add changelog generation

### Medium Term
- [ ] Implement remaining Sauda ability animations
- [ ] Fix Psi level 1 model artifacts
- [ ] Add configuration options (disable specific skins, etc.)
- [ ] Support for additional Chinese skins if available

### Long Term
- [ ] Create asset bundle extraction tool
- [ ] Add in-game mod settings menu
- [ ] Support for custom user-created skins
- [ ] Automated compatibility updates for new BTD6 versions

## Won't Fix

### Including Asset Bundles in Repository
**Reason**: Copyright and file size concerns. Asset bundles contain Ninja Kiwi's proprietary 3D models, textures, and audio. Including them would:
- Violate intellectual property rights
- Make repository extremely large
- Complicate version control

### Supporting Versions Older Than v52
**Reason**: BTD6 modding APIs change between versions. Supporting multiple versions would require:
- Multiple branches
- Complex conditional compilation
- Significantly more testing

## Reporting Issues

Found a new issue? Please report it on GitHub with:
- BTD6 version
- Mod version
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable

See existing issues: https://github.com/TheCrazy8/btd6mod/issues
