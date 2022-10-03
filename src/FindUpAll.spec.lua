--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FindUpAll = require(script.Parent.FindUpAll)

local TestRoot = ReplicatedStorage.TestTarget:FindFirstChild("Thing1", true)

return function()
	it("should find the correct objects", function()
		expect(#FindUpAll(TestRoot, "SendMoney")).to.equal(2)
	end)
end
