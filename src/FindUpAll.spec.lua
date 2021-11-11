local Create = require(script.Parent.Util.Create)
local FindUpAll = require(script.Parent.FindUpAll)

local TARGET = Create("Folder", {
  Name = "__TEST_TARGET__",
  Parent = script,
})

local START = Create("Folder", {
  Name = "__START__",
  Parent = Create("Folder", {
    Parent = Create("Folder", {
      Parent = TARGET,
    }),
  }),
})

return function()
  local OBJECTS = {
    MODULE = Create("ModuleScript", { Name = "SomeModule", Parent = TARGET }),
    PART = Create("Part", { Name = "SomeModule", Parent = TARGET }),
  }

  it("should find the correct objects", function()
    local objects = FindUpAll(START, "SomeModule")

    expect(#objects).to.equal(2)
    expect(table.find(objects, OBJECTS.MODULE)).to.be.ok()
    expect(table.find(objects, OBJECTS.MODULE)).to.be.ok()
  end)

  afterAll(function()
    for _, obj in pairs(OBJECTS) do
      obj:Destroy()
    end
  end)
end
