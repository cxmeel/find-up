--!strict
local NONE = require(script.Parent.None)

return function<T>(schema: T, input: any): T
  local options = {}

  for key, value in pairs(schema) do
    options[key] = if value == NONE then nil else value
  end

  if type(input) ~= "table" then
    return options::any
  end

  for key, _ in pairs(schema::any) do
    if input[key] ~= nil or input[key] ~= NONE then
      options[key] = input[key]
    end
  end

  return options::any
end
