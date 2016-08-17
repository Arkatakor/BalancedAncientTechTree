-- Insert SQL Rules Here 
--	fishing
UPDATE Builds SET PrereqTech = 'TECH_FISHING' WHERE Type = 'BUILD_FISHING_BOATS';

--	Update sailing tech prerequisite to fishing instead of pottery
UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_FISHING' WHERE TechType = 'TECH_SAILING';

--	hunting
UPDATE Builds SET PrereqTech = 'TECH_HUNTING' WHERE Type = 'BUILD_CAMP';

--	Add prereq tech
--	INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_TRAPPING', 'TECH_HUNTING');

--	Add prereq tech for writing
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech) VALUES ('TECH_WRITING', 'TECH_MYSTICISM');

UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_HUNTING' WHERE TechType = 'TECH_ARCHERY';
UPDATE Technology_PrereqTechs Set PrereqTech = 'TECH_STONE_TOOLS' WHERE TechType = 'TECH_MINING';

