
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

-- corn
minetest.register_craftitem("farming:seed_cactus", {
	description = S("Cactus Seeds"),
	inventory_image = "ef_cactus_seeds.png",
	groups = {food_corn = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:cactus_1")
	end,
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("farming:cactus_essence", {
	description = S("cactus Essence"),
	inventory_image = "ef_cactus_essence.png",
	groups = {food_corn = 1, flammable = 2},
})

-- corn on the cob (texture by TenPlus1)
minetest.register_craftitem("farming:corn_cob", {
	description = S("Corn on the Cob"),
	inventory_image = "farming_corn_cob.png",
	groups = {food_corn_cooked = 1, flammable = 2},
	on_use = minetest.item_eat(5),
})

-- corn definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"ef_cactus_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
crop_def.tiles = {"ef_cactus.png"}
minetest.register_node("farming:cactus_1", table.copy(crop_def))

crop_def.tiles = {"ef_cactus_1.png"}
minetest.register_node("farming:cactus_2", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"ef_cactus_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:cactus'}, rarity = 1},
		{items = {'farming:cactus'}, rarity = 2},
		{items = {'farming:cactus'}, rarity = 3},
		{items = {'farming:seed_cactus'}, rarity = 1},
		{items = {'farming:seed_cactus'}, rarity = 3},
	}
}
minetest.register_node("farming:cactus_3", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"ef_cactus_3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:cactus 2'}, rarity = 1},
		{items = {'farming:cactus 2'}, rarity = 2},
		{items = {'farming:cactus 2'}, rarity = 2},
		{items = {'farming:seed_cactus'}, rarity = 1},
		{items = {'farming:seed_cactus'}, rarity = 3},
	}
}
minetest.register_node("farming:cactus_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:cactus"] = {
	crop = "farming:cactus",
	seed = "farming:cactus_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
