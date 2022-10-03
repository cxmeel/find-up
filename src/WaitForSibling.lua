--!strict
local ReconcileOptions = require(script.Parent.Util.ReconcileOptions)
local NONE = require(script.Parent.Util.None)

--[=[
    @interface WaitForSiblingOptions
    @within FindUp
    .ignoreCase boolean? -- Whether to ignore case when comparing names
    .className string? -- The class name of the instance to find
    .isA string? -- Performs an `:IsA` check on each child
    .predicate function? -- A function that should return true if the instance is a match
    .timeout number? -- The maximum time to wait for the instance to appear

    Default options:

    ```lua
    {
      ignoreCase = nil,
      className = nil,
      isA = nil,
      predicate = nil,
      timeout = nil,
    }
    ```
]=]
export type WaitForSiblingOptions = {
	ignoreCase: boolean?,
	className: string?,
	isA: string?,
	predicate: ((instance: Instance) -> boolean)?,
	timeout: number?,
}

local DEFAULT_OPTIONS = {
	ignoreCase = NONE,
	className = NONE,
	isA = NONE,
	predicate = NONE,
	timeout = NONE,
} :: WaitForSiblingOptions

local function SatisfiesOptions(child: Instance, name: string, options: WaitForSiblingOptions): boolean
	local ok, result = pcall(function()
		if options.ignoreCase then
			return child.Name:lower() == name:lower()
		end

		return child.Name == name
	end)

	if not (ok and result) then
		return false
	end

	if options.className then
		ok, result = pcall(function()
			return child.ClassName == options.className
		end)

		if not (ok and result) then
			return false
		end
	end

	if options.isA then
		ok, result = pcall(function()
			return child:IsA(options.isA)
		end)

		if not (ok and result) then
			return false
		end
	end

	if options.predicate then
		return options.predicate(child)
	end

	return true
end

--[=[
    @function WaitForSibling
    @within FindUp

    @param self Instance -- The instance to start searching from
    @param name string -- The name of the sibling to wait for
    @param options (WaitForSiblingOptions | number)? -- The options to use when searching or the timeout
]=]
local function WaitForSibling<T>(self: Instance, name: string, options: (WaitForSiblingOptions | number)?): T?
	local opts: WaitForSiblingOptions = ReconcileOptions(DEFAULT_OPTIONS, options)
	local parent = assert(self.Parent, string.format("Instance %q is currently parented to nil", self.Name))

	if typeof(options) == "number" then
		opts.timeout = options
	end

	for _, child in parent:GetChildren() do
		if SatisfiesOptions(child, name, opts) then
			return child
		end
	end

	local signal = Instance.new("BindableEvent")
	local resolved = nil

	local connection = parent.ChildAdded:Connect(function(child)
		if SatisfiesOptions(child, name, opts) then
			resolved = child
			signal:Fire()
		end
	end)

	if opts.timeout then
		task.spawn(function()
			task.wait(opts.timeout)
			signal:Fire()
		end)
	end

	if not resolved then
		signal.Event:Wait()
	end

	if connection then
		connection:Disconnect()
	end

	return resolved
end

return WaitForSibling
