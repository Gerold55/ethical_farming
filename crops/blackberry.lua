
local S = farming.intllib

-- blackberries
minetest.register_craftitem("farming:blackberries", {
	description = S("blackberries"),
	inventory_image = "farming_blackberries.png",
	groups = {food_blackberries = 1, food_blackberry = 1, food_berry = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:blackberry_1")
	end,
	on_use = minetest.item_eat(1),
})

-- blackberry muffin (thanks to sosogirl123 @ deviantart.com for muffin image)

minetest.register_craftitem("farming:muffin_blackberry", {
	description = S("blackberry Muffin"),
	inventory_image = "farming_blackberry_muffin.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:muffin_blackberry 2",
	recipe = {
		{"group:food_blackberries", "group:food_bread", "group:food_blackberries"},
	}
})

-- blackberry Pie

minetest.register_craftitem("farming:blackberry_pie", {
	description = S("blackberry Pie"),
	inventory_image = "farming_blackberry_pie.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	output = "farming:blackberry_pie",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_sugar",
		"group:food_blackberries", "group:food_baking_tray"
	},
	replacements = {{"group:food_baking_tray", "farming:baking_tray"}}
})

-- blackberry definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_blueberry_1.png"},
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
minetest.register_node("farming:blueberry_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_blueberry_2.png"}
minetest.register_node("farming:blueberry_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_blueberry_3.png"}
minetest.register_node("farming:blueberry_3", table.copy(crop_def))

-- stage 4 (final)
crop_def.tiles = {"farming_blackberry_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:blackberries 2'}, rarity = 1},
		{items = {'farming:blackberries'}, rarity = 2},
		{items = {'farming:blackberries'}, rarity = 3},
	}
}
minetest.register_node("farming:blackberry_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:blackberries"] = {
	crop = "farming:blackberry",
	seed = "farming:blackberries",
	minlight = 13,
	maxlight = 15,
	steps = 4
}
