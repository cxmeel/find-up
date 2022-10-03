--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FindFirstSibling = require(script.Parent.FindFirstSibling)

local TestRoot = ReplicatedStorage.TestTarget:FindFirstChild("Thing2", true)

return function()
	print(TestRoot)

	it("should find the first sibling", function()
		local result = FindFirstSibling(TestRoot, "Thing1")

		expect(result).to.be.ok()
		expect(result.Name).to.equal("Thing1")
	end)
end
