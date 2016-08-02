--	AI's have to research pottery on all difficulty levels
DELETE FROM HandicapInfo_AIFreeTechs WHERE TechType = 'TECH_POTTERY' AND HandicapType NOT LIKE 'HANDICAP_DEITY';

king
Pottery	
*agriculture

emperor
-Pottery, Animal Husbandry	
*agriculture
*hunting

immortal
-Pottery, Animal Husbandry, Mining	
*agriculture
*hunting
*fishing

Diety
Pottery, Animal Husbandry, Mining
-The Wheel
*agriculture
*hunting
*fishing
