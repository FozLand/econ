local max_cost  = 1e6     -- Should be higher than most expensive item
local fuel_cost = 1/90    -- Add this much per cooking recipe burn time
local crafting_cost = 1/90-- Add this much per item in recipe
local margin    = 0.5     -- Sell price at this (50) percent above cost

local function from_stairsplus(name)
	return name:match("%w+:stair_") or
		     name:match("%w+:slab_")  or
		     name:match("%w+:slope_") or
		     name:match("%w+:panel_") or
		     name:match("%w+:micro_") or false
end

-- Borrowed from xban2
local function repr(x)
	if type(x) == "string" then
		return ("%q"):format(x)
	else
		return tostring(x)
	end
end

local function serialize(t, level)
	level = level or 0
	local lines = { }
	local indent = ("\t"):rep(level)
	for k, v in pairs(t) do
		local typ = type(v)
		if typ == "table" then
			table.insert(lines,
			  indent..("[%s] = {\n"):format(repr(k))
			  ..serialize(v, level + 1).."\n"
			  ..indent.."},")
		else
			table.insert(lines,
			  indent..("[%s] = %s,"):format(repr(k), repr(v)))
		end
	end
	return table.concat(lines, "\n")
end

local function print_table(t)
	return "return {\n"..serialize(t, 1).."\n}"
end

local aliases = {}
for source, target in pairs(minetest.registered_aliases) do
	aliases[target] = aliases[target] or {}
	table.insert(aliases[target], source)
end

local all_recipes = {}

local function cost_of(name)
	return (all_recipes[name] and all_recipes[name].min_cost) or max_cost
end

function econ.price_of(itemstring)
	local stack_max   = ItemStack(itemstring):get_stack_max()
	local unit_price  = cost_of(itemstring)*(1 + margin)
	local stack_price = unit_price*stack_max
	local s =(" cost %d mineninth per stack of %d (%.2f each).")
	return s:format(stack_price, stack_max, unit_price)
end

minetest.register_chatcommand('price', {
	params = '<itemstring>',
	description = 'Return the server price of an item.',
	privs = {judge = true},
	func = function(name, param)
		local itemstring = param:match('^(%S+)$')
		if not (itemstring and all_recipes[itemstring]) then
			return false, 'Invalid itemstring, see /help price.'
		end
		local stack_max   = ItemStack(itemstring):get_stack_max()
		local unit_price  = cost_of(itemstring)*(1 + margin)
		local stack_price = unit_price*stack_max
		minetest.chat_send_player(name, itemstring ..
			(" cost %d mineninth per stack of %d"):format(stack_price, stack_max) ..
			(" (%.2f each)."):format(unit_price))
	end,
})

minetest.after(0, function()
	-- Make a table of recipes for each item and group.  Extract the recipe's
	-- output quantity and initialize the recipe's cost.
	for name, def in pairs(minetest.registered_items) do
		--if not from_stairsplus(name) then

			all_recipes[name] = {}
			all_recipes[name].min_cost = max_cost

			-- Create entries to track the minimum cost of each group.
			for group, _ in pairs(def.groups) do
				group = 'group:' .. group
				all_recipes[group] = {}
				all_recipes[group].min_cost = max_cost
			end

			if econ.raw_items[name] then
				-- Add self referencing recipe.
				local recipe = {
					method = 'raw',
					cost   = econ.raw_items[name],
					qty    = 1,
					items  = {
						name,
					}
				}
				table.insert(all_recipes[name], recipe)
				all_recipes[name].min_cost = recipe.cost -- Save one iteration.
			end

			-- Add all of the item's recipes.
			local all_names = aliases[name] or {}
			table.insert(all_names, name)
			for _, a_name in ipairs(all_names) do
				local recipes = minetest.get_all_craft_recipes(a_name) or {}
				for _,recipe in ipairs(recipes) do
					local skip = false
					if recipe.method == 'fuel' then skip = true end
					if recipe.output == ''     then skip = true end
					--for _,item in pairs(recipe.items) do
						--if from_stairsplus(item) then
							----skip = true
							--break
						--end
					--end
					if not skip then
						recipe.cost = max_cost
						recipe.qty  = recipe.output:match("%d+$") or 1
						table.insert(all_recipes[name], recipe)
					end
				end
			end

		--end
	end

	-- Iterate over each item, refining the cost at each iteration.
	repeat
		local convergence = true
		for name, recipes in pairs(all_recipes) do

			local min_cost = recipes.min_cost

			-- Update the items minimum cost.
			for _, recipe in ipairs(recipes) do
				local cost = 0
				for _, item in pairs(recipe.items) do
					if item:match('group:dye,') then
						item = item:gsub('dye,','')
					end
					if item:match('group:flower,') then
						item = item:gsub('flower,','')
					end
					cost = cost +
						(all_recipes[item] and all_recipes[item].min_cost or max_cost)
					if recipe.method ~= 'raw' then
						cost = cost + crafting_cost
					end
				end
				if recipe.method == 'cooking' then
					cost = cost + recipe.width*fuel_cost
				end
				cost = cost/recipe.qty
				if cost == 0 then
					print(name)
					print(print_table(recipe))
					assert(false, "This recipe should not have zero cost.")
				end

				-- Round the price so full stacks have integer cost.
				local stack_max = ItemStack(name):get_stack_max()
				cost = math.floor(cost*stack_max + 1/2)/stack_max

				recipe.cost = cost
				min_cost = math.min(min_cost, recipe.cost)
			end

			-- Check for convergence.
			if recipes.min_cost ~= min_cost then
				convergence = false
			end
			recipes.min_cost = min_cost

			-- Update each group's minimum cost.
			local groups = minetest.registered_items[name] and
			               minetest.registered_items[name].groups or {}
			for g,v in pairs(groups) do
				if v and v ~= 0 then
					g = 'group:' .. g
					all_recipes[g].min_cost = math.min(all_recipes[g].min_cost, min_cost)
				end
			end

		end
	until convergence == true

	minetest.log("action", "Finished calculating item costs.")

	--[[
	local path = minetest:get_worldpath()
	local data = print_table(all_recipes)
	local file = io.open(path.."/all_recipes.lua", "w")
	if file then
		file:write(data)
		file:close()
	else
		minetest.log("error", "Can't save file")
	end
	--]]

end)

