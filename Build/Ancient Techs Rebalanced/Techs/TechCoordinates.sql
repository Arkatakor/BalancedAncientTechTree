--	Relocate tech coordinates
UPDATE Technologies Set GridY = 1 WHERE Type = 'TECH_AGRICULTURE';

--OLD
--UPDATE Technologies Set GridY = 4 WHERE Type = 'TECH_ANIMAL_HUSBANDRY';
--UPDATE Technologies Set GridY = 5 WHERE Type = 'TECH_ARCHERY';

UPDATE Technologies Set GridY = 3 WHERE Type = 'TECH_ANIMAL_HUSBANDRY';
UPDATE Technologies Set GridY = 5 WHERE Type = 'TECH_ARCHERY';
UPDATE Technologies Set GridY = 3 WHERE Type = 'TECH_HUNTING';
--UPDATE Technologies Set GridY = 3 WHERE Type = 'TECH_TRAPPING';
UPDATE Technologies Set GridY = 6 WHERE Type = 'TECH_THE_WHEEL';
--UPDATE Technologies Set GridY = 5 WHERE Type = 'TECH_WOOD_WORKING';
--UPDATE Technologies Set GridY = 7 WHERE Type = 'TECH_MINING';
--UPDATE Technologies Set GridY = 7 WHERE Type = 'TECH_MASONRY';


-- hunting up, wheel down, wood up, 

--woodworking 2 up, mining 1 up (8), masonry 1 up (8)
