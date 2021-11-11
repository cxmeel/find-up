--!strict
local FindUpAll = require(script.Parent.FindUpAll)

return function(self: Instance, name: string, options: FindUpAll.FindUpOptions): Instance?
  local matches = FindUpAll(self, name, options)

  if #matches > 0 then
    return matches[1]
  end

  return nil
end
