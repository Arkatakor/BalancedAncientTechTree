-- Insert SQL Rules Here 
-----------------------------------------------------------------------
--	FISHING 
-----------------------------------------------------------------------
UPDATE Technology_Flavors SET TechType = 'TECH_FISHING' WHERE TechType = 'TECH_SAILING' 
AND FlavorType = 'FLAVOR_NAVAL_TILE_IMPROVEMENT';

-----------------------------------------------------------------------
--	HUNTING 
-----------------------------------------------------------------------
--	let the AI know this is for tile improvement
UPDATE Technology_Flavors SET TechType = 'TECH_HUNTING' WHERE TechType = 'TECH_TRAPPING' 
AND FlavorType = 'FLAVOR_TILE_IMPROVEMENT';

-----------------------------------------------------------------------
--	MYSTICISM
-----------------------------------------------------------------------
--	let the AI know this is for religion
--	Let AI know that this tech offers small science boost
INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor) VALUES('TECH_MYSTICISM','FLAVOR_SCIENCE', 1)

--	Update religion indicator for AI; pottery no longer offers religion (shrine), mysticism does
UPDATE Technology_Flavors SET TechType = 'TECH_MYSTICISM' WHERE TechType = 'TECH_POTTERY' AND FlavorType = 'FLAVOR_RELIGION';

-----------------------------------------------------------------------
--	STONE_TOOLS 
-----------------------------------------------------------------------
--	Let AI know that this tech offers small culture boost (through monument)
INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor) VALUES('TECH_STONE_TOOLS','FLAVOR_CULTURE', 4)
--	For axe warrior
INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor) VALUES('TECH_STONE_TOOLS','FLAVOR_DEFENSE', 3)