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
function  KnossosDamageEndTurn(playerID)
	
		--	Also stores the plot location of knossos if it exists
	g_iKnossosPlayerID = GetKnossosPlayerID()

	if g_iKnossosPlayerID == nil or IsObsolote() then
		return
	end

	local player = Players[playerID]

	if (player:IsAlive() and IsPlayerAtWarWithKnossosOwner(playerID)) then
		--	loop thru players units and damage them if in vicinity to knossos
		for unit in player:Units() do
			local plot = unit:GetPlot()			
			if (plot and not plot:IsWater() and IsUnitPlotNearKnossos(plot)) then
				local plotDistance = GetPlotDistanceFromKnossos(plot)
				SetUnitDamage(unit, plotDistance)
			end	
			
		end
	end
end

function  KnossosDamageUnitMove(playerID, unitID, unitX, unitY)
	--	Also stores the plot location of knossos if it exists
	g_iKnossosPlayerID = GetKnossosPlayerID()

	if g_iKnossosPlayerID == nil or IsObsolote() then
		return
	end

	local player = Players[playerID]

	if (player:IsAlive() and IsPlayerAtWarWithKnossosOwner(playerID)) then
		local unit = player:GetUnitByID(unitID)
		local plot = unit:GetPlot()

		if IsUnitPlotNearKnossos(plot) and not plot:IsWater() then
			local plotDistance = GetPlotDistanceFromKnossos(plot)
			SetUnitDamage(unit, plotDistance)
		end
	end
end

GameEvents.PlayerDoTurn.Add( KnossosDamageEndTurn)
GameEvents.UnitSetXY.Add( KnossosDamageUnitMove)

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
	
	local plotDistance = Map.PlotDistance(plot:GetX(), plot:GetY(), g_iKnossosBuildingPlot:GetX(), g_iKnossosBuildingPlot:GetY())

	if plotDistance <= 3 and plotDistance > 0 then
		return true
	end
	
	return false
end

function GetPlotDistanceFromKnossos(plot)

	return Map.PlotDistance(plot:GetX(), plot:GetY(), g_iKnossosBuildingPlot:GetX(), g_iKnossosBuildingPlot:GetY())

end


function SetUnitDamage(unit, plotDistance)

	local damageAmount

	if plotDistance == 3  then
		damageAmount = math.random(6, 9)
	elseif plotDistance == 2 then
		damageAmount = math.random(9, 12)
	else
		damageAmount = math.random(12, 15)
	end

	if unit:IsBarbarian() then
 		damageAmount = damageAmount * 5
	end

	unit:SetDamage(unit:GetDamage() + damageAmount)
end

function IsUnitDistanceNearKnossos(plotDistance)
	
	if plotDistance <= 3 and plotDistance > 0 then
		return true
	end
	
	return false
end

function IsObsolote()

	if g_iKnossosPlayerID == nil then
		return true
	end

	local knossosPlayer 		= Players[g_iKnossosPlayerID]
	local techID				= GameInfoTypes["TECH_DYNAMITE"]
	local pknossosPlayerTeam 	= Teams[knossosPlayer:GetTeam()]

	if (pknossosPlayerTeam:GetTeamTechs():HasTech(techID)) then
		return true
	end

	return false
end