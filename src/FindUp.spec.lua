local Create = require(script.Parent.Util.Create)
local FindUp = require(script.Parent.FindUp)

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
		SCRIPT = Create("Script", { Name = "SomeScript", Parent = TARGET }),
		MODULE = Create("ModuleScript", { Name = "SomeModule", Parent = TARGET }),
		PART = Create("Part", { Name = "SomePart", Parent = TARGET }),
		PART2 = Create("Part", { Name = "SomeModule", Parent = TARGET }),
	}

	it("should find the correct object", function()
		expect(FindUp(START, "SomeScript")).to.equal(OBJECTS.SCRIPT)
		expect(FindUp(START, "SomePart")).to.equal(OBJECTS.PART)
	end)

	it("should find the correct object (className)", function()
		expect(FindUp(START, "SomeModule", { className = "Part" })).to.equal(OBJECTS.PART2)
	end)

	it("should find the correct object (isA)", function()
		expect(FindUp(START, "SomeModule", { isA = "LuaSourceContainer" })).to.equal(OBJECTS.MODULE)
	end)

	it("should find the correct object (ignoreCase)", function()
		expect(FindUp(START, "somescript", { ignoreCase = true })).to.equal(OBJECTS.SCRIPT)
		expect(FindUp(START, "somepart", { ignoreCase = true })).to.equal(OBJECTS.PART)
	end)

	it("should find the correct object (predicate)", function()
		expect(FindUp(START, "somemodule", {
			ignoreCase = true,
			predicate = function(object)
				return object.ClassName == "ModuleScript"
			end,
		})).to.equal(OBJECTS.MODULE)
	end)

	it("should stop at the given stopAt point", function()
		expect(FindUp(START, "SomeModule", { stopAt = START.Parent })).to.equal(nil)
	end)

	afterAll(function()
		for _, obj in pairs(OBJECTS) do
			obj:Destroy()
		end
	end)
end
