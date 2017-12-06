--	AI's have to research pottery on all difficulty levels
DELETE FROM HandicapInfo_AIFreeTechs WHERE TechType = 'TECH_POTTERY' AND HandicapType NOT LIKE 'HANDICAP_DEITY';