local cloneref = cloneref or function(obj)
	return obj
end

local Services = setmetatable({}, {
	__index = function(self, obj)
		return cloneref(game:GetService(obj))
	end
})

local Players = Services.Players
local lplr = Players.LocalPlayer

local raycast = {}
function raycast:CanSee(target, filter)
    local rayParams, res = RaycastParams.new(), nil
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances = filter or {lplr.Character}

    res = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, target.Position - lplr.Character.HumanoidRootPart.Position, rayParams)
    return res and res.Instance == target
end

return raycast
