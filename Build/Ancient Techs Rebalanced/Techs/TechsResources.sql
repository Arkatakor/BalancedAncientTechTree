-- Insert SQL Rules Here 
--	Update resources trading to reflect on fishing
UPDATE Resources SET TechCityTrade = 'TECH_FISHING' WHERE TYPE = 'RESOURCE_FISH';
UPDATE Resources SET TechCityTrade = 'TECH_FISHING' WHERE TYPE = 'RESOURCE_PEARLS';
UPDATE Resources SET TechCityTrade = 'TECH_FISHING' WHERE TYPE = 'RESOURCE_CRAB';
UPDATE Resources SET TechCityTrade = 'TECH_FISHING' WHERE TYPE = 'RESOURCE_WHALE';

--	Update resources trading to reflect on hunting
UPDATE Resources SET TechCityTrade = 'TECH_HUNTING' WHERE TYPE = 'RESOURCE_DEER';
UPDATE Resources SET TechCityTrade = 'TECH_HUNTING' WHERE TYPE = 'RESOURCE_IVORY';
UPDATE Resources SET TechCityTrade = 'TECH_HUNTING' WHERE TYPE = 'RESOURCE_FUR';
UPDATE Resources SET TechCityTrade = 'TECH_HUNTING' WHERE TYPE = 'RESOURCE_BISON';
UPDATE Resources SET TechCityTrade = 'TECH_HUNTING' WHERE TYPE = 'RESOURCE_TRUFFLES';
