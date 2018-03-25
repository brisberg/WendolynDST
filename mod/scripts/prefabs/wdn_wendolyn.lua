--local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
}
local prefabs = {}
local start_inv = {
	-- Custom starting items
  "wdn_catears",
}

local function IsValidVictim(victim)
    return victim ~= nil
        and victim:HasTag("rabbit") or
            victim:HasTag("beefalo") or
            (victim:HasTag("pig") and not victim:HasTag("werepig")) or
            victim:HasTag("mossling") or
            victim:HasTag("butterfly")
end

local function onkilled(inst, data)
    local victim = data.victim
    if IsValidVictim(victim) then
        -- local delta = victim.components.combat.defaultdamage * 0.25
        -- inst.components.health:DoDelta(delta, false, "battleborn")
        inst.components.sanity:DoDelta(-10)
    end
end

local common_fn = function(inst)
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "wdn_wendolyn.tex" )
end

local master_fn = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "wdn_wendolyn"

	-- Stats
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)

	-- Damage multiplier (optional)
  inst.components.combat.damagemultiplier = 1


  inst:ListenForEvent("killed", onkilled)
end

return pf.MakePlayerCharacter("wdn_wendolyn", prefabs, assets, common_fn, master_fn, start_inv)
