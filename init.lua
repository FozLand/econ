local load_time_start = os.clock()

local modpath = minetest.get_modpath('econ')

econ = {}
dofile(modpath..'/raw_prices.lua')
dofile(modpath..'/price_items.lua')

local count = 0
for _ in pairs(minetest.registered_nodes) do
	count = count + 1
end
minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs '..
		'('..count..') registered nodes',
		os.clock() - load_time_start
	)
)
