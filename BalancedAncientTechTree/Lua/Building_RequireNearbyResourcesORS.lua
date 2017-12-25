-- Building_RequireNearbyResourcesORS
-- Author: LeeS
-- DateCreated: 8/13/2016 6:04:59 PM
--------------------------------------------------------------

include("CityNearbyMapDatas.lua")


local tBuildingRequireNearbyResourcesORS = {}
for row in GameInfo.Building_RequireNearbyResourcesORS() do
	if not tBuildingRequireNearbyResourcesORS[GameInfoTypes[row.BuildingType]] then
		tBuildingRequireNearbyResourcesORS[GameInfoTypes[row.BuildingType]] = { }
	end
	table.insert(tBuildingRequireNearbyResourcesORS[GameInfoTypes[row.BuildingType]], GameInfoTypes[row.ResourceType])
end

-------------------------------------------------------------------------------------------------------
-- BuildingsRequireNearbyResourcesORS
-------------------------------------------------------------------------------------------------------
function BuildingsRequireNearbyResourcesORS(PlayerID, CityID, BuildingType)
	if tBuildingRequireNearbyResourcesORS[BuildingType] then
		local pPlayer = Players[PlayerID]
		local pCity = pPlayer:GetCityByID(CityID)
		local tCityMapDatas = GetCityMapDatasResources(pCity, "Resources")
		for Item,iResourceID in pairs(tBuildingRequireNearbyResourcesORS[BuildingType]) do
			if DoesResourceExistNearCity(tCityMapDatas, iResourceID) then
				if tCityMapDatas.Resources[iResourceID].NumPlotsCounted > tCityMapDatas.Resources[iResourceID].NumUnclaimedPlots then
					return true
				end
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(BuildingsRequireNearbyResourcesORS);

print("Building_RequireNearbyResourcesORS.lua loaded successfully")