-- Base prices for items players can get by mining, farming or gathering.
econ.raw_items = {
	['bamboo:item'] = 2,
	['bamboo:item_dry'] = 1,
	['bamboo:sapling'] = 4,

	['bucket:bucket_lava'] = 62,
	['bucket:bucket_river_water'] = 9,
	['bucket:bucket_water'] = 9,

	['bushes:blackberry'] = 2/10,
	['bushes:blackberry_bush'] = 20,
	['bushes:blueberry'] = 2/10,
	['bushes:blueberry_bush'] = 20,
	['bushes:gooseberry'] = 2/10,
	['bushes:gooseberry_bush'] = 20,
	['bushes:raspberry'] = 2/10,
	['bushes:raspberry_bush'] = 20,
	['bushes:strawberry_bush'] = 20,

	['default:acacia_bush_leaves'] = 24/495,
	['default:acacia_bush_sapling'] = 20,
	['default:acacia_bush_stem'] = 1,
	['default:acacia_leaves'] = 24/495,
	['default:acacia_sapling'] = 20,
	['default:acacia_tree'] = 1,
	['default:apple'] = 3/10,
	['default:aspen_leaves'] = 24/495,
	['default:aspen_sapling'] = 20,
	['default:aspen_tree'] = 1,
	['default:bush_leaves'] = 24/495,
	['default:bush_sapling'] = 5,
	['default:bush_stem'] = 1,
	['default:cactus'] = 1,
	--['default:clay_lump'] = 1,
	['default:coal_lump'] = 1,
	['default:cobble'] = 16/495,
	['default:copper_lump'] = 6,
	['default:coral_brown'] = 4,
	['default:coral_orange'] = 4,
	['default:coral_skeleton'] = 4,
	['default:desert_cobble'] = 16/495,
	['default:diamond'] = 36,
	--['default:dirt'] = 1,
	['default:dry_grass_1'] = 2,
	['default:dry_shrub'] = 2,
	['default:flint'] = 15,
	['default:gold_lump'] = 18,
	['default:grass_1'] = 2,
	--['default:gravel'] = 1,
	['default:ice'] = 1,
	['default:iron_lump'] = 2,
	['default:junglegrass'] = 3,
	['default:jungleleaves'] = 24/495,
	['default:junglesapling'] = 20,
	['default:jungletree'] = 1,
	['default:leaves'] = 24/495,
	['default:mese_crystal'] = 54,
	['default:obsidian'] = 2,
	['default:papyrus'] = 1,
	['default:pine_needles'] = 1,
	['default:pine_sapling'] = 20,
	['default:pine_tree'] = 33/99,
	['default:sapling'] = 20,
	['default:snowblock'] = 1,
	['default:tin_lump'] = 3,
	['default:tree'] = 1,

	['farming:cotton'] = 5/11,
	['farming:pumpkin'] = 1,
	['farming:pumpkin_face'] = 1,
	['farming:pumpkin_face_light'] = 1,
	['farming:seed_cotton'] = 2/3,
	['farming:seed_wheat'] = 2/3,
	['farming:wheat'] = 5/22,

	['farming_plus:banana'] = 1,
	['farming_plus:banana_leaves'] = 24/495,
	['farming_plus:banana_sapling'] = 20,
	['farming_plus:carrot_item'] = 1,
	['farming_plus:carrot_seed'] = 2/3,
	['farming_plus:cocoa'] = 1,
	['farming_plus:cocoa_leaves'] = 24/495,
	['farming_plus:cocoa_sapling'] = 20,
	['farming_plus:corn_item'] = 1,
	['farming_plus:corn_seed'] = 2/3,
	['farming_plus:orange_item'] = 5/10,
	['farming_plus:potato_item'] = 1,
	['farming_plus:potato_seed'] = 2/3,
	['farming_plus:rhubarb_item'] = 1,
	['farming_plus:rhubarb_seed'] = 2/3,
	['farming_plus:strawberry_item'] = 2/10,
	['farming_plus:strawberry_seed'] = 2/3,
	['farming_plus:tomato_item'] = 1,
	['farming_plus:tomato_seed'] = 2/3,

	['fishing:coral1'] = 1,
	['fishing:coral2'] = 1,
	['fishing:coral3'] = 1,
	['fishing:coral4'] = 1,
	['fishing:coral5'] = 1,
	['fishing:fish_raw'] = 1,
	['fishing:seaweed'] = 1,

	['flowers:dandelion_white'] = 2,
	['flowers:dandelion_yellow'] = 2,
	['flowers:geranium'] = 2,
	['flowers:mushroom_brown'] = 2,
	['flowers:mushroom_red'] = 2,
	['flowers:rose'] = 2,
	['flowers:seaweed'] = 2,
	['flowers:sunflower'] = 2,
	['flowers:tulip'] = 2,
	['flowers:viola'] = 2,
	['flowers:waterlily'] = 2,

	['moognu:moognu'] = 32400,
	['moognu:moognu_rainbow'] = 6480,

	['moreores:mithril_lump'] = 36,
	['moreores:silver_lump'] = 12,

	['moretrees:acorn'] = 1,
	['moretrees:apple_tree_leaves'] = 24/495,
	['moretrees:apple_tree_sapling'] = 5,
	['moretrees:apple_tree_trunk'] = 33/99,
	['moretrees:beech_leaves'] = 24/495,
	['moretrees:beech_sapling'] = 5,
	['moretrees:beech_trunk'] = 33/99,
	['moretrees:birch_leaves'] = 24/495,
	['moretrees:birch_sapling'] = 5,
	['moretrees:birch_trunk'] = 33/99,
	['moretrees:cedar_cone'] = 1,
	['moretrees:cedar_leaves'] = 24/495,
	['moretrees:cedar_sapling'] = 5,
	['moretrees:cedar_trunk'] = 33/99,
	['moretrees:coconut'] = 1,
	['moretrees:date'] = 1,
	['moretrees:date_palm_leaves'] = 24/495,
	['moretrees:date_palm_sapling'] = 5,
	['moretrees:date_palm_trunk'] = 33/99,
	['moretrees:fir_cone'] = 1,
	['moretrees:fir_leaves'] = 24/495,
	['moretrees:fir_leaves_bright'] = 24/495,
	['moretrees:fir_sapling'] = 5,
	['moretrees:fir_trunk'] = 33/99,
	['moretrees:jungletree_leaves_red'] = 24/495,
	['moretrees:jungletree_leaves_yellow'] = 24/495,
	['moretrees:jungletree_trunk'] = 33/99,
	['moretrees:oak_leaves'] = 24/495,
	['moretrees:oak_sapling'] = 5,
	['moretrees:oak_trunk'] = 33/99,
	['moretrees:palm_leaves'] = 24/495,
	['moretrees:palm_sapling'] = 1,
	['moretrees:palm_trunk'] = 33/99,
	['moretrees:poplar_leaves'] = 24/495,
	['moretrees:poplar_sapling'] = 5,
	['moretrees:poplar_small_sapling'] = 5,
	['moretrees:poplar_trunk'] = 33/99,
	['moretrees:raw_coconut'] = 1/2,
	['moretrees:rubber_tree_leaves'] = 24/495,
	['moretrees:rubber_tree_sapling'] = 5,
	['moretrees:rubber_tree_trunk'] = 33/99,
	['moretrees:rubber_tree_trunk_empty'] = 33/99,
	['moretrees:sequoia_leaves'] = 24/495,
	['moretrees:sequoia_sapling'] = 5,
	['moretrees:sequoia_trunk'] = 33/99,
	['moretrees:spruce_cone'] = 1,
	['moretrees:spruce_leaves'] = 24/495,
	['moretrees:spruce_sapling'] = 5,
	['moretrees:spruce_trunk'] = 33/99,
	['moretrees:willow_leaves'] = 24/495,
	['moretrees:willow_sapling'] = 5,
	['moretrees:willow_trunk'] = 33/99,

	['snow:apple'] = 1,
	['snow:leaves'] = 24/495,
	['snow:needles'] = 1,
	['snow:needles_decorated'] = 3,
	['snow:sapling_pine'] = 20,
	['snow:shrub'] = 1,
	['snow:shrub_covered'] = 1,
	['snow:star'] = 600,
	['snow:xmas_tree'] = 120,
}

-- Some of the code below was usefull for starting this list of items.
--[[
local raw_items = {}
for name, def in pairs(minetest.registered_nodes) do
	if def.drop and
	  (not def.groups.not_in_creative_inventory or
	   def.groups.not_in_creative_inventory == 0) then
		if type(def.drop) == 'string' and def.drop ~= name then
			raw_items[def.drop] = 1
	  elseif def.drop.items then
			for _,item in ipairs(def.drop.items) do
				for _,v in ipairs(item.items) do
					raw_items[v] = 1
				end
			end
		end
	end
end

local rev_aliases = {}
for source, target in pairs(minetest.registered_aliases) do
	if not rev_aliases[target] then rev_aliases[target] = {} end
	table.insert(rev_aliases[target], source)
end

for name, def in pairs(minetest.registered_items) do
	if (not def.groups.not_in_creative_inventory or
	   def.groups.not_in_creative_inventory == 0) and
	   def.description and def.description ~= "" then
		local all_names = rev_aliases[name] or {}
		table.insert(all_names, name)
		local all_recipes = {}
		for _, a_name in ipairs(all_names) do
			local recipes = minetest.get_all_craft_recipes(a_name)
			for _,v in ipairs(recipes or {}) do
				all_recipes[#all_recipes+1] = v
			end
			if #all_recipes == 0 then raw_items[name] = 1
			-- Note some raw items have recipes e.g. diamond from diamond block
		end
	end
end

local i = 1
local raw_list = {}
for k,_ in pairs(raw_items) do
	raw_list[i] = k
	i = i + 1
end
print(" Found " .. i .. " raw items.")
table.sort(raw_list)
local path = minetest:get_worldpath()
local data = xban.serialize(raw_list)
local file = io.open(path.."/raw_list.lua", "w")
if file then
	file:write(data)
	file:close()
else
	minetest.log("error", "Can't save file")
end
--]]
