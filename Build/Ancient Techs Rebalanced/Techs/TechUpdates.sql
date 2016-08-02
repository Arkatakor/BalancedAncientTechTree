-----------------------------------------------------------------------
--	GENERAL UPDATES
-----------------------------------------------------------------------
--	Make agricultur researchable
DELETE FROM Civilization_FreeTechs WHERE TechType = 'TECH_AGRICULTURE';

--	AI's have to research pottery on all difficulty levels 
DELETE FROM HandicapInfo_AIFreeTechs WHERE TechType = 'TECH_POTTERY';

--	Remove The Wheel from Diety
DELETE FROM HandicapInfo_AIFreeTechs WHERE TechType = 'TECH_THE_WHEEL';

--	Remove mining from immortal
DELETE FROM HandicapInfo_AIFreeTechs WHERE TechType = 'TECH_MINING' AND HandicapType = 'HANDICAP_IMMORTAL';

--	Add prereq tech
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_TRAPPING', 'TECH_HUNTING');

--	Add prereq tech for writing
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_WRITING', 'TECH_MYSTICISM');

UPDATE Technology_PrereqTechs Set PrereqTech = '' WHERE TechType = 'TECH_MINING';
UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_HUNTING' WHERE TechType = 'TECH_ARCHERY';

--	Relocate tech coordinates
UPDATE Technologies Set GridY = 1 WHERE Type = 'TECH_AGRICULTURE';
UPDATE Technologies Set GridY = 6 WHERE Type = 'TECH_ARCHERY';
UPDATE Technologies Set GridY = 3 WHERE Type = 'TECH_ANIMAL_HUSBANDRY';

--	let the AI know this is for religion
INSERT INTO Technology_Flavors SET TechType = 'TECH_MYSTICISM' WHERE TechType = 'TECH_SAILING' AND FlavorType = 'FLAVOR_NAVAL_TILE_IMPROVEMENT';
