--!strict
type Dictionary<K, V> = { [K]: V }

return function<T>(class: string, props: Dictionary<string, any>): T
	local instance: T = Instance.new(class)
	local parent = props.Parent

	for key, value in pairs(props) do
		if key ~= "Parent" then
			instance[key] = value
		end
	end

	if parent then
		instance.Parent = parent
	end

	return instance
end
