local name = "wdn_catears"

local assets = {
    Asset("ANIM", "anim/"..name..".zip") ,
    Asset( "IMAGE", "images/inventoryimages/"..name..".tex" ),
    Asset( "ATLAS", "images/inventoryimages/"..name..".xml" ),
}
local prefabs = nil

local function onequip(inst, owner, symbol_override)
    owner.AnimState:OverrideSymbol("swap_hat", name, "swap_hat")
    owner.AnimState:OverrideSymbol("tail", name, "tail")

    owner.AnimState:Show("HAT")
    -- owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end

    if inst.components.fueled ~= nil then
        inst.components.fueled:StartConsuming()
    end
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:ClearOverrideSymbol("tail")

    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    -- owner.AnimState:Show("HAIR")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end

    if inst.components.fueled ~= nil then
        inst.components.fueled:StopConsuming()
    end
end

-- local function opentop_onequip(inst, owner)
--     local skin_build = inst:GetSkinBuild()
--     if skin_build ~= nil then
--         owner:PushEvent("equipskinneditem", inst:GetSkinName())
--         owner.AnimState:OverrideItemSkinSymbol("swap_hat", skin_build, "swap_hat", inst.GUID, name)
--     else
--         owner.AnimState:OverrideSymbol("swap_hat", name, "swap_hat")
--     end
--
--     owner.AnimState:Show("HAT")
--     owner.AnimState:Hide("HAIR_HAT")
--     owner.AnimState:Show("HAIR_NOHAT")
--     owner.AnimState:Show("HAIR")
--
--     owner.AnimState:Show("HEAD")
--     owner.AnimState:Hide("HEAD_HAT")
--
--     if inst.components.fueled ~= nil then
--         inst.components.fueled:StartConsuming()
--     end
-- end

local function fn()
    local inst = pf.CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank(name)
    inst.AnimState:SetBuild(name)
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("hat")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/"..name..".xml"
    inst:AddComponent("inspectable")

    inst:AddComponent("tradable")

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    pf.MakeHauntableLaunch(inst)

    return inst
end



STRINGS.NAMES.WDN_CATEARS = "Cute Cat Ears"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WDN_CATEARS = "The animals will love me with these!"


return Prefab(name, fn, assets, prefabs)
