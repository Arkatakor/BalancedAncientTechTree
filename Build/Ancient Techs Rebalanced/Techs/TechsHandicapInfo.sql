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

--	Relocate tech coordinates
UPDATE Technologies Set GridY = 1 WHERE Type = 'TECH_AGRICULTURE';
UPDATE Technologies Set GridY = 5 WHERE Type = 'TECH_ARCHERY';
UPDATE Technologies Set GridY = 3 WHERE Type = 'TECH_ANIMAL_HUSBANDRY';

