
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

local plant_table = { --name, color, colorize(hex or color name:intensity(1-255))
{'Black', 'black', 'black:225'},
{'Blue', 'blue', 'blue:225'},
{'Brown', 'brown', 'brown:225'},
{'Cyan', 'cyan', 'cyan:200'},
{'Dark Green', 'dark_green', 'green:225'},
{'Dark Grey', 'dark_grey', 'black:200'},
{'Green', 'green', '#32cd32:150'},
{'Grey', 'grey', 'black:100'},
{'Magenta', 'magenta', 'magenta:200'},
{'Orange', 'orange', 'orange:225'},
{'Pink', 'pink', 'pink:225'},
{'Red', 'red', 'red:225'},
{'Violet', 'violet', 'violet:225'},
{'White', 'white', 'white:1'},
{'Yellow', 'yellow', 'yellow:225'},
}

for i in ipairs (plant_table) do
	local name = plant_table[i][1]
	local color = plant_table[i][2]
	local hex = plant_table[i][3]
	
-- corn
minetest.register_craftitem("farming:seed_"..color, {
	description = S(name.." Seeds"),
	inventory_image = "ef_seeds.png^[colorize:"..hex,
	groups = {food_corn = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:"..color.."_1")
	end,
	on_use = minetest.item_eat(3),
})


minetest.register_craftitem("farming:"..color.."_essence", {
	description = S(name.." Essence"),
	inventory_image = "ef_essence_item.png^[colorize:"..hex,
	groups = {food_corn = 1, flammable = 2},
})

-- corn definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"ef_top.png^[colorize:"..hex.."^ef_stem.png"},
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
minetest.register_node("farming:"..color.."_1", table.copy(crop_def))

crop_def.tiles = {"ef_"..color.."_2.png"}
minetest.register_node("farming:"..color.."_2", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"ef_"..color.."_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:'..color..'_essence'}, rarity = 1},
		{items = {'farming:'..color..'_essence'}, rarity = 2},
		{items = {'farming:seed_'..color}, rarity = 1},
		{items = {'farming:seed_'..color}, rarity = 3},
	}
}
minetest.register_node("farming:"..color.."_3", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"ef_top.png^ef_stem.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:'..color..'_essence'}, rarity = 1},
		{items = {'farming:'..color..'_essence'}, rarity = 2},
		{items = {'farming:'..color..'_essence'}, rarity = 3},
		{items = {'farming:seed_'..color}, rarity = 1},
		{items = {'farming:seed_'..color}, rarity = 3},
	}
}
minetest.register_node("farming:"..color.."_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:"..color] = {
	crop = "farming:"..color,
	seed = "farming:"..color.."_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
end