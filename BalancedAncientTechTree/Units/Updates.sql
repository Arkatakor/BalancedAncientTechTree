UPDATE Units SET PrereqTech = 'TECH_FISHING' WHERE Class = 'UNITCLASS_WORKBOAT';
UPDATE Units SET PrereqTech = 'TECH_HUNTING' WHERE Class = 'UNITCLASS_SCOUT';

INSERT INTO UnitPromotions 
			(Type, 								Description, 							Help, 										Sound, 				EnemyDamageChance,	ExtraAttacks,	CanMoveAfterAttacking,	EnemyDamage,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('DEBUFF_KNOSSOS_DAMAGE', 			'TXT_KEY_DEBUFF_KNOSSOS_DAMAGE',		'TXT_KEY_DEBUFF_KNOSSOS_DAMAGE_HELP', 		'AS2D_IF_LEVELUP', 	100,					0,				0,						5,				1, 				57, 		'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_DEBUFF_KNOSSOS_DAMAGE');