local assets =
{
	Asset( "ANIM", "anim/wdn_wendolyn.zip" ),
	Asset( "ANIM", "anim/ghost_wdn_wendolyn_build.zip" ),
}

local skins =
{
	normal_skin = "wdn_wendolyn",
	ghost_skin = "ghost_wdn_wendolyn_build",
}

local base_prefab = "wdn_wendolyn"

local tags = {"WDN_WENDOLYN", "CHARACTER"} --字符

return pf.CreatePrefabSkin("wdn_wendolyn_none",
{
	base_prefab = base_prefab,
	skins = skins,
	assets = assets,
	tags = tags,

	skip_item_gen = true,
	skip_giftable_gen = true,
})
