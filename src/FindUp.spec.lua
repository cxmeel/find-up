--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FindUp = require(script.Parent.FindUp)

local TestRoot = ReplicatedStorage.TestTarget:FindFirstChild("Thing2", true)

return function()
	it("should find the correct object", function()
		expect(FindUp(TestRoot, "Thing1")).to.be.ok()
		expect(FindUp(TestRoot, "Roact")).to.be.ok()
	end)

	it("should find the correct object (className)", function()
		local func = FindUp(TestRoot, "SendMoney", { className = "RemoteFunction" })
		local evt = FindUp(TestRoot, "SendMoney", { className = "RemoteEvent" })

		expect(func).to.be.ok()
		expect(evt).to.be.ok()

		expect(func.ClassName).to.equal("RemoteFunction")
		expect(evt.ClassName).to.equal("RemoteEvent")
	end)

	it("should find the correct object (isA)", function()
		expect(FindUp(TestRoot, "DoThing", { isA = "ValueBase" })).to.be.ok()
	end)

	it("should find the correct object (ignoreCase)", function()
		expect(FindUp(TestRoot, "roact", { ignoreCase = true })).to.be.ok()
	end)

	it("should find the correct object (predicate)", function()
		expect(FindUp(TestRoot, "sendmoney", {
			ignoreCase = true,
			predicate = function(object)
				return object.ClassName == "RemoteEvent"
			end,
		})).to.be.ok()
	end)

	it("should stop at the given stopAt point", function()
		expect(FindUp(TestRoot, "SendMoney", { stopAt = TestRoot.Parent })).to.equal(nil)
	end)
end
