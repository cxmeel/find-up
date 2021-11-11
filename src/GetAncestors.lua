--!strict
local ReconcileOptions = require(script.Parent.Util.ReconcileOptions)
local NONE = require(script.Parent.Util.None)

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

local function GetAncestors(self: Instance, options: GetAncestorsOptions?): {Instance}
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
