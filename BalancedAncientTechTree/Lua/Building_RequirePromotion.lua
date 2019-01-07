-- Building_RequirePromotion
-- Author: zakariel
-- DateCreated: 07-Jan-19 2:00:04 PM
--------------------------------------------------------------
local tBuildingRequirePromotion = {}
for row in GameInfo.Building_RequirePromotion() do
	if not tBuildingRequirePromotion[GameInfoTypes[row.BuildingType]] then
		tBuildingRequirePromotion[GameInfoTypes[row.BuildingType]] = { }
	end
	table.insert(tBuildingRequirePromotion[GameInfoTypes[row.BuildingType]], row.ExperienceRequired)
end

-------------------------------------------------------------------------------------------------------
-- BuildingsRequireNearbyResourcesORS
-------------------------------------------------------------------------------------------------------
function BuildingsRequirePromotion(PlayerID, CityID, BuildingType)

	if tBuildingRequirePromotion[BuildingType] then

		local pPlayer = Players[PlayerID]

		if pPlayer:IsAlive() and IsBuildingCanBeBuilt(PlayerID) then

			for BuildingType,iExperienceRequired in pairs(tBuildingRequirePromotion[BuildingType]) do

				--	LEFTOFF HERE:
				--	loop thru players units and damage them if in vicinity to knossos
				for unit in pPlayer:Units() do

					local iExperience = unit:GetExperience()

					if (iExperience >= iExperienceRequired) then
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

function IsBuildingCanBeBuilt(PlayerID)

	if PlayerID == nil then
		return false
	end

	local player 				= Players[PlayerID]
	--	TODO: find a way to not hardcode this; apparantly there one can store multiple values in key pair table (stackoverflow)
	local obsoleteTechID		= GameInfoTypes["TECH_SCIENTIFIC_THEORY"]
	local requriedTechID		= GameInfoTypes["TECH_STONE_TOOLS"]
	local pknossosPlayerTeam 	= Teams[player:GetTeam()]

	if not pknossosPlayerTeam:GetTeamTechs():HasTech(requriedTechID) or pknossosPlayerTeam:GetTeamTechs():HasTech(obsoleteTechID)then
		return false
	end

	return true
end
