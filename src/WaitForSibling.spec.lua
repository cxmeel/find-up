--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local WaitForSibling = require(script.Parent.WaitForSibling)

local TestRoot = ReplicatedStorage.TestTarget:FindFirstChild("Thing1", true)

return function()
	it("should find the first matching sibling", function()
		local result = WaitForSibling(TestRoot, "Thing2")

		expect(result).to.be.ok()
		expect(result).to.be.a("userdata")
		expect(result.Name).to.equal("Thing2")
	end)

	it("should timeout if the sibling is not found", function()
		local result = WaitForSibling(TestRoot, "Thing100", 0.5)
		local result2 = WaitForSibling(TestRoot, "Thing100", {
			timeout = 0.5,
		})

		expect(result).never.to.be.ok()
		expect(result2).never.to.be.ok()
	end)

	it("should warn if no timeout is provided", function()
		local newenv = getfenv(WaitForSibling)
		local didWarnSignal = Instance.new("BindableEvent")
		local didWarn = false
		local oldWarn = warn

		newenv.warn = function(...)
			didWarn = true
			didWarnSignal:Fire()

			oldWarn(...)
		end

		local fenv = setfenv(WaitForSibling, newenv)

		task.spawn(function()
			fenv(TestRoot, "Thing100")
		end)

		didWarnSignal.Event:Wait()

		expect(didWarn).to.equal(true)
	end)

	it("should resolve once the sibling is found", function()
		task.spawn(function()
			task.wait(3)

			local sibling = Instance.new("Folder")
			sibling.Name = "Thing10"
			sibling.Parent = TestRoot.Parent
		end)

		local result = WaitForSibling(TestRoot, "Thing10", 5)

		expect(result).to.be.ok()
		expect(result).to.be.a("userdata")
		expect(result.Name).to.equal("Thing10")
	end)
end
