-----------------------------------------------------------------------
--	WOOD WORKING
-----------------------------------------------------------------------
UPDATE Builds SET PrereqTech = 'TECH_WOOD_WORKING' WHERE Type = 'BUILD_LUMBERMILL';
-----------------------------------------------------------------------
--	FISHING
-----------------------------------------------------------------------
UPDATE Builds SET PrereqTech = 'TECH_FISHING' WHERE Type = 'BUILD_FISHING_BOATS';
-----------------------------------------------------------------------
--	HUNTING 
-----------------------------------------------------------------------
UPDATE Builds SET PrereqTech = 'TECH_HUNTING' WHERE Type = 'BUILD_CAMP';
