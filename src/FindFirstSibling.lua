--!strict
local merge = require(script.Parent.Util.Merge)
local FindUp = require(script.Parent.FindUp)

local _T = require(script.Parent.types)

--[=[
	@function FindFirstSibling
	@within FindUp

	@param self Instance -- The instance to start searching from (i.e. the child whose sibling you want to find)
	@param name string -- The name of the sibling to find
	@param options FindUpAllOptions? -- The options to use when searching
	@return Instance? -- The sibling found

	Searches for the first sibling of `self` with the given name. This is a shortcut
	for using `FindUp` with `stopAt` set to `self.Parent`.

	```lua
	local sibling = FindFirstSibling(script, "ShopGuiFrame")
	```
]=]
local function FindFirstSibling(self: Instance, name: string, options: _T.FindUpAllOptions?): Instance?
	local newOptions: _T.FindUpAllOptions = merge({ stopAt = self.Parent }, options)
	return FindUp(self, name, newOptions)
end

return FindFirstSibling
