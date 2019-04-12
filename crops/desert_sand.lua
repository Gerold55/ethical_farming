
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

-- corn
minetest.register_craftitem("farming:seed_desert_sand", {
	description = S("desert_sand Seeds"),
	inventory_image = "ef_desert_sand_seeds.png",
	groups = {food_corn = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:desert_sand_1")
	end,
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("farming:desert_sand_essence", {
	description = S("desert_sand Essence"),
	inventory_image = "ef_desert_sand_essence.png",
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
	tiles = {"ef_desert_sand_1.png"},
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
crop_def.tiles = {"ef_desert_sand.png"}
minetest.register_node("farming:desert_sand_1", table.copy(crop_def))

crop_def.tiles = {"ef_desert_sand_1.png"}
minetest.register_node("farming:desert_sand_2", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"ef_desert_sand_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:desert_sand'}, rarity = 1},
		{items = {'farming:desert_sand'}, rarity = 2},
		{items = {'farming:desert_sand'}, rarity = 3},
		{items = {'farming:seed_desert_sand'}, rarity = 1},
		{items = {'farming:seed_desert_sand'}, rarity = 3},
	}
}
minetest.register_node("farming:desert_sand_3", table.copy(crop_def))


-- add to registered_plants
farming.registered_plants["farming:desert_sand"] = {
	crop = "farming:desert_sand",
	seed = "farming:desert_sand_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
