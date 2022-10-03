--!strict
local ReconcileOptions = require(script.Parent.Util.ReconcileOptions)
local NONE = require(script.Parent.Util.None)

--[=[
  @interface GetAncestorsOptions
  @within FindUp
  .stopAt Instance? -- The instance to stop at
  .includeSelf boolean? -- Whether to include `self` in the results
  .includeStopAt boolean? -- Whether to include `stopAt` in the results

  Default options:

  ```lua
  {
    stopAt = nil,
    includeSelf = nil,
    includeStopAt = nil,
  }
  ```
]=]
export type GetAncestorsOptions = {
	stopAt: Instance?,
	includeSelf: boolean?,
	includeStopAt: boolean?,
}

local DEFAULT_OPTIONS: GetAncestorsOptions = {
	stopAt = NONE,
	includeSelf = NONE,
	includeStopAt = NONE,
}

--[=[
  @function GetAncestors
  @within FindUp

  @param self Instance -- The instance to start searching from
  @param options GetAncestorsOptions? -- The options to use when searching
  @return {Instance} -- The instances found

  Returns all instances in the ancestry of `self`.

  ```lua
  local ancestors = GetAncestors(script)

  local ancestors = GetAncestors(script, {
    stopAt = game.Workspace,
    includeSelf = true,
    includeStopAt = true,
  })
  ```
]=]
local function GetAncestors(self: Instance, options: GetAncestorsOptions?): { Instance }
	local opts: GetAncestorsOptions = ReconcileOptions(DEFAULT_OPTIONS, options)
	local ancestry = {}

	if opts.includeSelf then
		table.insert(ancestry, self)
	end

	local parent = self.Parent

	while parent do
		if parent == opts.stopAt then
			if opts.includeStopAt then
				table.insert(ancestry, parent)
			end

			break
		end

		table.insert(ancestry, parent)
		parent = parent.Parent
	end

	return ancestry
end

return GetAncestors
