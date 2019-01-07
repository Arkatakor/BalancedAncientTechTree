-- Building_RequirePromotion
-- Author: zakariel
-- DateCreated: 07-Jan-19 2:00:04 PM
--------------------------------------------------------------
local tBuildingRequirePromotion = {}
for row in GameInfo.Building_RequirePromotion() do
	if not tBuildingRequirePromotion[GameInfoTypes[row.BuildingType]] then
		tBuildingRequirePromotion[GameInfoTypes[row.BuildingType]] = { }
	end
	table.insert(tBuildingRequirePromotion[GameInfoTypes[row.BuildingType]], row.PromotionLevelRequired)
end

-------------------------------------------------------------------------------------------------------
-- BuildingsRequireNearbyResourcesORS
-------------------------------------------------------------------------------------------------------
function BuildingsRequirePromotion(PlayerID, CityID, BuildingType)

	if tBuildingRequirePromotion[BuildingType] then

		local pPlayer = Players[PlayerID]

		if player:IsAlive() and not IsBuildingObsolote(PlayerID) then

			for BuildingType,iPromotionLevelRequered in pairs(tBuildingRequirePromotion[BuildingType]) do

				--	LEFTOFF HERE:
				--	loop thru players units and damage them if in vicinity to knossos
				for unit in player:Units() do

					local iLevel = unit:GetLevel()

					if (iLevel >= iPromotionLevelRequered then
						return true
					end	
					
				end		
			end
			return false
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(BuildingsRequirePromotion);

print("Building_RequirePromotion.lua loaded successfully")

function IsBuildingObsolote(PlayerID)

	if PlayerID == nil then
		return true
	end

	local player 				= Players[g_iKnossosPlayerID]
	--	TODO: find a way to not hardcode this
	local techID				= GameInfoTypes["TECH_SCIENTIFIC_THEORY"]
	local pknossosPlayerTeam 	= Teams[player:GetTeam()]

	if (pknossosPlayerTeam:GetTeamTechs():HasTech(techID)) then
		return true
	end

	return false
end
