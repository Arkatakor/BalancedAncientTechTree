--	Relocate tech coordinates
UPDATE Technologies Set GridY = 1 WHERE Type = 'TECH_AGRICULTURE';


UPDATE Technologies Set GridY = 4 WHERE Type = 'TECH_ANIMAL_HUSBANDRY';
UPDATE Technologies Set GridY = 5 WHERE Type = 'TECH_ARCHERY';
--UPDATE Technologies Set GridY = 7 WHERE Type = 'TECH_MINING';

--UPDATE Technologies Set GridY = 3 WHERE Type = 'TECH_TRAPPING';


