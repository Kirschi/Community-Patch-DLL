UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_MECHANIZED_INFANTRY'
WHERE UnitType = 'UNIT_DANISH_SKI_INFANTRY';

UPDATE Unit_FreePromotions
SET PromotionType = 'PROMOTION_GUERILLA_FIGHTER'
WHERE UnitType = 'UNIT_DANISH_SKI_INFANTRY';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_ROMAN_BALLISTA' , 'PROMOTION_COVER_1'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_COMBINED_ARMS'
WHERE Type = 'UNIT_SHOSHONE_COMANCHE_RIDERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_COMBINED_ARMS'
WHERE Type = 'UNIT_RUSSIAN_COSSACK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_COMBINED_ARMS'
WHERE Type = 'UNIT_BERBER_CAVALRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

DELETE FROM Unit_AITypes
WHERE UnitType = 'UNIT_VENETIAN_GALLEASS' AND UnitAIType = 'UNITAI_EXPLORE_SEA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Borrowed from Whoward's tutorial on triggers

CREATE TRIGGER Unit_BuildingClassPurchaseRequireds
AFTER INSERT ON Units
WHEN EXISTS ( SELECT Type FROM Units WHERE Type = NEW.Type )
BEGIN
INSERT INTO Unit_BuildingClassPurchaseRequireds( UnitType, BuildingClassType )
SELECT ( NEW.Type ), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType IN ( SELECT DefaultUnit FROM UnitClasses WHERE Type = NEW.Class );
END;