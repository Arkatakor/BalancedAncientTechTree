-------------------------------------------------------
--	FISHING
-------------------------------------------------------
UPDATE Builds SET PrereqTech = 'TECH_FISHING' WHERE Type = 'BUILD_FISHING_BOATS';

-------------------------------------------------------
--	HUNTING
-------------------------------------------------------
--	hunting
UPDATE Builds SET PrereqTech = 'TECH_HUNTING' WHERE Type = 'BUILD_CAMP';

-------------------------------------------------------
--	SAILING
-------------------------------------------------------
--	Update sailing tech prerequisite to fishing instead of pottery
UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_FISHING' WHERE TechType = 'TECH_SAILING';

-------------------------------------------------------
--	ANIMAL HUSBANDRY
-------------------------------------------------------
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_ANIMAL_HUSBANDRY';
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_ANIMAL_HUSBANDRY', 'TECH_HUNTING');

-------------------------------------------------------
--	WRITING
-------------------------------------------------------
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_WRITING', 'TECH_MYSTICISM');

-------------------------------------------------------
--	ARCHERY
-------------------------------------------------------
UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_HUNTING' WHERE TechType = 'TECH_ARCHERY';

-------------------------------------------------------
--	MINING
-------------------------------------------------------
UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_STONE_TOOLS' WHERE TechType = 'TECH_MINING';

-------------------------------------------------------
--	THE WHEEL
-------------------------------------------------------
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_THE_WHEEL', 'TECH_WOOD_WORKING');

-------------------------------------------------------
--	WOOD WORKING
-------------------------------------------------------
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_WOOD_WORKING', 'TECH_STONE_TOOLS');