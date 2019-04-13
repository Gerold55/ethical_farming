minetest.register_node("farming:stone_with_essence", {
	description = "Essence Ore",
	tiles = {"default_stone.png^default_mineral_essence.png"},
	groups = {cracky = 3},
	drop = 'farming:essence',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("farming:essence", {
	description = "Essence",
	inventory_image = "ef_essence_item.png",
})


minetest.register_ore({
		ore_type       = "scatter",
		ore            = "farming:stone_with_essence",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "farming:stone_with_essence",
		wherein        = "default:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 0,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "farming:stone_with_essence",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = -64,
		y_min          = -31000,
	})