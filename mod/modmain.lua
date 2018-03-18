PrefabFiles = {
	"wdn_wendolyn",
	"wdn_wendolyn_none",
}

Assets = {
  Asset( "IMAGE", "images/saveslot_portraits/wdn_wendolyn.tex" ),
  Asset( "ATLAS", "images/saveslot_portraits/wdn_wendolyn.xml" ),

  Asset( "IMAGE", "images/selectscreen_portraits/wdn_wendolyn.tex" ),
  Asset( "ATLAS", "images/selectscreen_portraits/wdn_wendolyn.xml" ),

  Asset( "IMAGE", "images/selectscreen_portraits/wdn_wendolyn_silho.tex" ),
  Asset( "ATLAS", "images/selectscreen_portraits/wdn_wendolyn_silho.xml" ),

  Asset( "IMAGE", "bigportraits/wdn_wendolyn.tex" ),
  Asset( "ATLAS", "bigportraits/wdn_wendolyn.xml" ),

	Asset( "IMAGE", "images/map_icons/wdn_wendolyn.tex" ),
	Asset( "ATLAS", "images/map_icons/wdn_wendolyn.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_wdn_wendolyn.tex" ),
	Asset( "ATLAS", "images/avatars/avatar_wdn_wendolyn.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_ghost_wdn_wendolyn.tex" ),
	Asset( "ATLAS", "images/avatars/avatar_ghost_wdn_wendolyn.xml" ),

	Asset( "IMAGE", "images/avatars/self_inspect_wdn_wendolyn.tex" ),
	Asset( "ATLAS", "images/avatars/self_inspect_wdn_wendolyn.xml" ),

	Asset("SOUNDPACKAGE", "sound/wdn_wendolyn_speech.fev"),
	Asset("SOUND", "sound/wdn_wendolyn_speech.fsb"),
}
if GLOBAL.TheSim:GetGameID() == "DS" then
	modimport "scripts/lib/polyfill-ds.lua"
elseif GLOBAL.TheSim:GetGameID() == "DST" then
	modimport "scripts/lib/polyfill-dst.lua"
end
local require = GLOBAL.require

-- The character select screen lines
GLOBAL.STRINGS.CHARACTER_TITLES.wdn_wendolyn = "The Animal Obsessed"
GLOBAL.STRINGS.CHARACTER_NAMES.wdn_wendolyn = "Wendolyn"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.wdn_wendolyn = "*Cat Ears\n*Cute Tail\n*Loves Animals"
GLOBAL.STRINGS.CHARACTER_QUOTES.wdn_wendolyn = "\"All the cute animals will love me and be my pets!\""

-- Custom speech strings
GLOBAL.STRINGS.CHARACTERS.WDN_WENDOLYN = require "speech_wdn_wendolyn"

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "wdn_wendolyn")

RemapSoundEvent( "dontstarve/characters/wdn_wendolyn/death_voice", "wdn_wendolyn_speech/characters/wdn_wendolyn/death_voice" )
RemapSoundEvent( "dontstarve/characters/wdn_wendolyn/hurt", "wdn_wendolyn_speech/characters/wdn_wendolyn/hurt" )
RemapSoundEvent( "dontstarve/characters/wdn_wendolyn/talk_LP", "wdn_wendolyn_speech/characters/wdn_wendolyn/talk_LP" )
AddMinimapAtlas("images/map_icons/wdn_wendolyn.xml")
AddModCharacter("wdn_wendolyn")
