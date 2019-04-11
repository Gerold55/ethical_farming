
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

-- corn
minetest.register_craftitem("farming:seed_mese", {
	description = S("Mese Seeds"),
	inventory_image = "ef_mese_seeds.png",
	groups = {food_corn = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:mese_1")
	end,
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("farming:mese_essence", {
	description = S("mese Essence"),
	inventory_image = "ef_mese_essence.png",
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
	tiles = {"ef_mese_1.png"},
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
crop_def.tiles = {"ef_mese.png"}
minetest.register_node("farming:mese_1", table.copy(crop_def))

crop_def.tiles = {"ef_mese_1.png"}
minetest.register_node("farming:mese_2", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"ef_mese_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:mese'}, rarity = 1},
		{items = {'farming:mese'}, rarity = 2},
		{items = {'farming:mese'}, rarity = 3},
		{items = {'farming:seed_mese'}, rarity = 1},
		{items = {'farming:seed_mese'}, rarity = 3},
	}
}
minetest.register_node("farming:mese_3", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"ef_mese_3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:mese 2'}, rarity = 1},
		{items = {'farming:mese 2'}, rarity = 2},
		{items = {'farming:mese 2'}, rarity = 2},
		{items = {'farming:seed_mese'}, rarity = 1},
		{items = {'farming:seed_mese'}, rarity = 3},
	}
}
minetest.register_node("farming:mese_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:mese"] = {
	crop = "farming:mese",
	seed = "farming:mese_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
