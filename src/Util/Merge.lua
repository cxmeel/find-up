--!strict
local None = require(script.Parent.None)

local function merge<T>(...: any): T
	local result = {}

	for dictionaryIndex = 1, select("#", ...) do
		local dictionary = select(dictionaryIndex, ...)

		if type(dictionary) ~= "table" then
			continue
		end

		for key, value in pairs(dictionary) do
			result[key] = if value == None then nil else value
		end
	end

	return result
end

return merge
