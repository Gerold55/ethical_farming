
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

-- corn
minetest.register_craftitem("farming:seed_desertsand", {
	description = S("Desert Sand Seeds"),
	inventory_image = "ef_desert_sand_seeds.png",
	groups = {food_corn = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:desertsand_1")
	end,
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("farming:sand_essence", {
	description = S("sand Essence"),
	inventory_image = "ef_sand_essence.png",
	groups = {food_corn = 1, flammable = 2},
})

-- corn definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"ef_desert_sand.png"},
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
minetest.register_node("farming:desertsand_1", table.copy(crop_def))

--stage 2

crop_def.tiles = {"ef_desert_sand_2.png"}
minetest.register_node("farming:desertsand_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"ef_desert_sand_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:desertsand_essence'}, rarity = 1},
		{items = {'farming:desertsand_essence'}, rarity = 2},
		{items = {'farming:desertsand_essence'}, rarity = 3},
		{items = {'farming:seed_desertsand'}, rarity = 1},
		{items = {'farming:seed_desertsand'}, rarity = 3},
	}
}
minetest.register_node("farming:desertsand_3", table.copy(crop_def))

-- stage 4 (final)
crop_def.tiles = {"ef_desert_sand_3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:desertsand_essence 2'}, rarity = 1},
		{items = {'farming:desertsand_essence 2'}, rarity = 2},
		{items = {'farming:desertsand_essence 2'}, rarity = 2},
		{items = {'farming:seed_desertsand'}, rarity = 1},
		{items = {'farming:seed_desertsand'}, rarity = 3},
	}
}
minetest.register_node("farming:desertsand_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:desertsand"] = {
	crop = "farming:desertsand",
	seed = "farming:seeds_desertsand",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
