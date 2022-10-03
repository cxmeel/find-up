--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GetAncestors = require(script.Parent.GetAncestors)

local TestRoot = ReplicatedStorage.TestTarget:FindFirstChild("Thing1", true)

return function()
	it("should return the ancestry as a table", function()
		local result = GetAncestors(TestRoot)

		expect(result).to.be.ok()
		expect(result).to.be.a("table")
		expect(#result).to.equal(5)

		expect(result[1].Name).to.equal("Things")
		expect(result[2].Name).to.equal("Methods")
		expect(result[3].Name).to.equal("TestTarget")
		expect(result[4]).to.equal(ReplicatedStorage)
		expect(result[5]).to.equal(game)
	end)
end
