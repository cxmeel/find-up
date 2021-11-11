--!strict
local ReconcileOptions = require(script.Parent.Util.ReconcileOptions)
local GetAncestors = require(script.Parent.GetAncestors)
local NONE = require(script.Parent.Util.None)

export type FindUpOptions = GetAncestors.GetAncestorsOptions & {
  ignoreCase: boolean?,
  className: string?,
  isA: string?,
  predicate: ((instance: Instance) -> boolean)?,
}

local DEFAULT_OPTIONS = {
  ignoreCase = NONE,
  className = NONE,
  isA = NONE,
  predicate = NONE,
}::FindUpOptions

local function FindUpAll(self: Instance, name: string, options: FindUpOptions?): {Instance}
  local ancestry = GetAncestors(self, options::GetAncestors.GetAncestorsOptions)
  local opts: FindUpOptions = ReconcileOptions(DEFAULT_OPTIONS, options)
  local matches = {}

  for _, ancestor in ipairs(ancestry) do
    for _, child in ipairs(ancestor:GetChildren()) do
      local doesMatch = false

      if opts.ignoreCase then
        local ok, result = pcall(function()
          return string.lower(child.Name) == string.lower(name)
        end)

        doesMatch = ok and result
      else
        local ok, result = pcall(function()
          return child.Name == name
        end)

        doesMatch = ok and result
      end

      if doesMatch then
        if opts.className then
          local ok, result = pcall(function()
            return child.ClassName == opts.className
          end)

          doesMatch = ok and result
        end

        if opts.isA then
          local ok, result = pcall(function()
            return child:IsA(opts.isA)
          end)

          doesMatch = ok and result
        end

        if opts.predicate then
          doesMatch = opts.predicate(child)
        end

        if doesMatch then
          table.insert(matches, child)
        end
      end
    end
  end

  return matches
end

return FindUpAll
