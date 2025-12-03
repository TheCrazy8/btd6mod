global using BTD_Mod_Helper.Extensions;
using MelonLoader;
using BTD_Mod_Helper;
using BTD6Mod;

[assembly: MelonInfo(typeof(BTD6Mod.BTD6Mod), ModHelperData.Name, ModHelperData.Version, ModHelperData.RepoOwner)]
[assembly: MelonGame("Ninja Kiwi", "BloonsTD6")]

namespace BTD6Mod;

public class BTD6Mod : BloonsTD6Mod
{
    public override void OnApplicationStart()
    {
        ModHelper.Msg<BTD6Mod>("BTD6Mod loaded!");
    }
}
