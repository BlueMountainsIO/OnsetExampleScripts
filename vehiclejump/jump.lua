--[[
Copyright (C) 2019 Blue Mountains GmbH

This program is free software: you can redistribute it and/or modify it under the terms of the Onset
Open Source License as published by Blue Mountains GmbH.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the Onset Open Source License for more details.

You should have received a copy of the Onset Open Source License along with this program. If not,
see https://bluemountains.io/Onset_OpenSourceSoftware_License.txt
]]--

local function OnKeyPress(key)
	local vehicle = GetPlayerVehicle(GetPlayerId())
	if vehicle ~= 0 then
		local VehicleSkeletalMeshComponent = GetVehicleSkeletalMeshComponent(vehicle)
		if GetVehicleDriver(vehicle) == GetPlayerId() then
			if key == 'H' then
				VehicleSkeletalMeshComponent:SetPhysicsLinearVelocity(FVector(0.0, 0.0, 800.0), true)
			end
			
			if (key == '2' or key == 'é') then
				VehicleSkeletalMeshComponent:SetPhysicsLinearVelocity(FVector(0.0, 0.0, 0.0), false)
				VehicleSkeletalMeshComponent:SetPhysicsAngularVelocityInDegrees(FVector(0.0, 0.0, 0.0), false)
			end
			
			if key == "Left Mouse Button" then
				local x, y, z = GetVehicleVelocity(vehicle)
			    local size = x * x + y * y + z * z
				if (size < 25000000) then
					local mult = 0.3
					VehicleSkeletalMeshComponent:SetPhysicsLinearVelocity(FVector(x * mult, y * mult, z * mult), true)
				end
			end
	    end
	end
end
AddEvent("OnKeyPress", OnKeyPress)
