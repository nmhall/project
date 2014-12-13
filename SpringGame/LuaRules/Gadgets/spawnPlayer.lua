--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    game_spawn.lua
--  brief:   spawns start unit and sets storage levels
--  author:  Tobi Vollebregt
--
--  Copyright (C) 2010.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name      = "Spawn",
		desc      = "spawns start unit and sets storage levels",
		author    = "Tobi Vollebregt",
		date      = "January, 2010",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true  --  loaded by default?
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- synced only
if (not gadgetHandler:IsSyncedCode()) then
	return false
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local modOptions = Spring.GetModOptions()


local function GetStartUnit(teamID)
	-- get the team startup info
	local side = select(5, Spring.GetTeamInfo(teamID))
	local startUnit
	if (side == "") then
		-- startscript didn't specify a side for this team
		local sidedata = Spring.GetSideData()
		if (sidedata and #sidedata > 0) then
			startUnit = "bit"
		end
	else
		startUnit = Spring.GetSideData(side)
	end
	return startUnit
end

local function SpawnStartUnit(teamID)
	local x,y,z = Spring.GetTeamStartPosition(teamID)
	--AI
	if teamID == 0 then
		local unitID = Spring.CreateUnit("bug", x,y,z,0,teamID)
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral(unitID,false)
	else
		local unitID = Spring.CreateUnit("alice", x,y,z,0,teamID)
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral(unitID,false)
		
		local unitID = Spring.CreateUnit("alice", x + 128,y,z,0,teamID)
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral(unitID,false)
		
		local unitID = Spring.CreateUnit("alice", x - 128,y,z,0,teamID)
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral(unitID,false)
	end
	
	
	
	--[[
	--First Bit
	local unitID = Spring.CreateUnit("bit", x, y, z, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--Second Bit
	local unitID = Spring.CreateUnit("bit", x + 128, y, z, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--Third Bit
	local unitID = Spring.CreateUnit("bit", x - 128, y, z, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--First Bug
	local unitID = Spring.CreateUnit("bug", x, y, z+ 128, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--Second Bug
	local unitID = Spring.CreateUnit("bug", x + 128, y , z + 128, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--Third Bug
	local unitID = Spring.CreateUnit("bug", x - 128, y , z + 128, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--First Smart
	local unitID = Spring.CreateUnit("smart", x, y , z - 128, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--Second Smart
	local unitID = Spring.CreateUnit("smart", x + 128, y , z - 128, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	
	--Third Smart
	local unitID = Spring.CreateUnit("smart", x - 128, y, z - 128, 0, teamID)
	if unitID then
		--Spring.SendMessageToTeam(2, tostring(teamID))
		Spring.SetUnitAlwaysVisible(unitID,true)
		Spring.SetUnitNeutral (unitID,false)
		--Spring.SetUnitNoSelect(unitID, false)
	end
	--]]
end


function gadget:GameStart()
	-- only activate if engine didn't already spawn units (compatibility)
	if (#Spring.GetAllUnits() > 0) then
		return
	end

	-- spawn start units
	local gaiaTeamID = Spring.GetGaiaTeamID()
	local teams = Spring.GetTeamList()
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		
		if (teamID ~= gaiaTeamID) then
			SpawnStartUnit(teamID)
		end

	end
end