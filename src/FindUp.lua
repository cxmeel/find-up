--!strict
local FindUpAll = require(script.Parent.FindUpAll)
local _T = require(script.Parent.types)

--[=[
  @function FindUp
  @within FindUp

  @param self Instance -- The instance to start searching from
  @param name string -- The name of the instance to find
  @param options FindUpAllOptions? -- The options to use when searching
  @return Instance? -- The instance found, or nil if not found

  Returns the closest instance in the ancestry of `self` that satisfies the
  given options.

  ```lua
  local folder = FindUp(script, "MyInstance", {
    className = "Folder",
  })
  ```
]=]
return function<T>(self: Instance, name: string, options: _T.FindUpAllOptions): T?
	local matches = FindUpAll(self, name, options)

	if #matches > 0 then
		return matches[1]
	end

	return nil
end
