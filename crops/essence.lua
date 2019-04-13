
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

-- corn
minetest.register_craftitem("farming:seed_essence", {
	description = S("Essence Seeds"),
	inventory_image = "ef_essence_seeds.png",
	groups = {food_corn = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:essenceplant_1")
	end,
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("farming:essence_item", {
	description = S("Essence"),
	inventory_image = "ef_essence_item.png",
	groups = {food_corn = 1, flammable = 2},
})

-- corn definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"ef_essence.png"},
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
minetest.register_node("farming:essenceplant_1", table.copy(crop_def))

--stage 2

crop_def.tiles = {"ef_essence_2.png"}
minetest.register_node("farming:essenceplant_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"ef_essence_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:essence_item'}, rarity = 1},
		{items = {'farming:essence_item'}, rarity = 2},
		{items = {'farming:essence_item'}, rarity = 3},
		{items = {'farming:seed_essence'}, rarity = 1},
		{items = {'farming:seed_essence'}, rarity = 3},
	}
}
minetest.register_node("farming:essenceplant_3", table.copy(crop_def))

-- stage 4 (final)
crop_def.tiles = {"ef_essence_3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:essence_item 2'}, rarity = 1},
		{items = {'farming:essence_item 2'}, rarity = 2},
		{items = {'farming:essence_item 2'}, rarity = 2},
		{items = {'farming:seed_essence'}, rarity = 1},
		{items = {'farming:seed_essence'}, rarity = 3},
	}
}
minetest.register_node("farming:essenceplant_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:essenceplant"] = {
	crop = "farming:essence",
	seed = "farming:essence_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
