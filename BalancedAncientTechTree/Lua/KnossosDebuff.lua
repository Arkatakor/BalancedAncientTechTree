-- KnossosDebuff
-- Author: fabho992
-- DateCreated: 12/13/2017 4:20:27 PM
--------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- Knossos Damage Debuff
----------------------------------------------------------------------------------------------------------------------------
local g_iBuildingKnossosID		= GameInfoTypes["BUILDING_KNOSSOS"]

local g_iKnossosPlayerID = nil
local g_iKnossosBuildingPlot = nil

-------------------------------------------------------------------------------
--	Event function - fires every turn
-------------------------------------------------------------------------------
function  KnossosDamage(playerID)
	
	print("entering KnossosDamage")
	--	Also stores the plot location of knossos if it exists
	g_iKnossosPlayerID = GetKnossosPlayerID()

	if (g_iKnossosPlayerID == nil)
		print("g_iKnossosPlayerID == nil")
		return
	end

	local player = Players[playerID]

	if (player:IsAlive() and IsPlayerAtWarWithKnossosOwner(playerID)) then
		print("IsPlayerAtWarWithKnossosOwner == true")
		local bIsUnitNearKnossos = false

		local playerUnits = player:Units()

		--	loop thru players units and damage them if in vicinity to knossos
		for _, unit in ipairs(playerUnits) do
			local plot = unit:GetPlot()			
			if (plot and (IsUnitPlotNearKnossos(plot))) then
				--	damage unit here
				unit:SetDamage(unit:GetDamage() + 10)				
			end	
			
		end
	end
end

GameEvents.PlayerDoTurn.Add( KnossosDamage)
--GameEvents.UnitSetXY.Add( KnossosDamage)

-------------------------------------------------------------------------------
--	Returns player ID of knossos owner.  also stores plot location of knossoss
--	in the global g_iKnossosBuildingPlot variable
-------------------------------------------------------------------------------
function GetKnossosPlayerID()
	
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]			
		if (player:IsAlive()) then
			for city in player:Cities() do
				if city:IsHasBuilding(g_iBuildingKnossosID) then 
					g_iKnossosPlayerID = playerID
					--	store the knossos building location in global variable
					g_iKnossosBuildingPlot = city:Plot()
					return g_iKnossosPlayerID
				end
			end
		end
	end
	
	return nil
end

-------------------------------------------------------------------------------
--	Checks if player is at war with knossos owner
-------------------------------------------------------------------------------
function IsPlayerAtWarWithKnossosOwner(playerID)
	local bIsAtWarWithKnossos = false
	if playerID ~= g_iKnossosPlayerID then
		local player = Players[playerID]
		local knossosPlayer = Players[g_iKnossosPlayerID]
		if Teams[player:GetTeam()]:IsAtWar(knossosPlayer:GetTeam()) then
			bIsAtWarWithKnossos = true
		end
	end
	
	return bIsAtWarWithKnossos
end

-------------------------------------------------------------------------------
--	If unit is within 2 plots of knossos return true
-------------------------------------------------------------------------------
function IsUnitPlotNearKnossos(plot)
	
	local plotDistance = Map.PlotDistance(plot.GetX(), plot.GetY(), g_iKnossosBuildingPlot.GetX(), g_iKnossosBuildingPlot.GetY())

	print("plotDistance result: ")
	print(plotDistance)

	if plotDistance <= 2 then
		return true
	end
	
	return false
end

