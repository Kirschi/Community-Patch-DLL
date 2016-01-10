-- Attila
DELETE FROM Civilization_UnitClassOverrides
WHERE UnitType = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET LandBarbarianConversionPercent = '100'
WHERE Type = 'TRAIT_RAZE_AND_HORSES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET RazeSpeedModifier = '0'
WHERE Type = 'TRAIT_RAZE_AND_HORSES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Mounted melee units deal more flanking damage and capture units, and defeated Barbarians in Encampments join you. When you gain Grassland or Plains tiles naturally, adjacent unowned tiles of the same type are also claimed.'
WHERE Tag = 'TXT_KEY_TRAIT_RAZE_AND_HORSES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'The barbarians in this Encampment have joined your army! All hail glorious Attila!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_BARB_CAMP_CONVERTS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

DELETE FROM Civilization_FreeTechs
WHERE TechType = 'TECH_ANIMAL_HUSBANDRY' AND CivilizationType = 'CIVILIZATION_HUNS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Trait_ImprovementYieldChanges
WHERE TraitType = 'TRAIT_RAZE_AND_HORSES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Make Horse Archer cost Horse
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
SELECT 'UNIT_HUN_HORSE_ARCHER', 'RESOURCE_HORSE', '1'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET CityAttackOnly = 'true'
WHERE Type = 'UNIT_HUN_BATTERING_RAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET Combat = '15'
WHERE Type = 'UNIT_HUN_BATTERING_RAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_Flavors
SET Flavor = '35'
WHERE FlavorType = 'FLAVOR_RANGED' AND UnitType = 'UNIT_HUN_BATTERING_RAM';

UPDATE Unit_Flavors
SET Flavor = '20'
WHERE FlavorType = 'FLAVOR_OFFENSE' AND UnitType = 'UNIT_HUN_BATTERING_RAM';	
-- Eki

INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_EKI', 'Improvement', 'Eki';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 1,  'ART_DEF_IMPROVEMENT_EKI', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'eki_UC.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 1,  'ART_DEF_IMPROVEMENT_EKI', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'eki_built.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 1,  'ART_DEF_IMPROVEMENT_EKI', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'eki_PL.fxsxml', 1;


-- Battering Ram - Move to Catapult

UPDATE Units
SET Class = 'UNITCLASS_CATAPULT'
WHERE Type = 'UNIT_HUN_BATTERING_RAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HUN_BATTERING_RAM' , 'PROMOTION_COVER_2'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET PrereqTech = 'TECH_ARCHERY'
WHERE Type = 'UNIT_HUN_BATTERING_RAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_GUNPOWDER'
WHERE Type = 'UNIT_HUN_BATTERING_RAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_UnitClassOverrides
Set UnitClassType = 'UNITCLASS_CATAPULT'
WHERE UnitType = 'UNIT_HUN_BATTERING_RAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Battering Rams are a Hunnic unique unit replacing the Catapult. Battering Rams are available earlier than Catapults, and are cheaper. Use Battering Rams to knock down the defenses of a city. They have the Cover I and II promotions to keep them safe from ranged units; attack them with melee units to defeat them.'
WHERE Tag = 'TXT_KEY_UNIT_HUN_BATTERING_RAM_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );
	
-- Horse Archer -- Break Off, Make Upgrade for Chariot Archer

UPDATE Units
SET Class = 'UNITCLASS_HORSE_ARCHER'
WHERE Type = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET PrereqTech = 'TECH_MATHEMATICS'
WHERE Type = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_PHYSICS'
WHERE Type = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET RangedCombat = '11'
WHERE Type = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET Combat = '7'
WHERE Type = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_Flavors
SET Flavor = '5'
WHERE UnitType = 'UNIT_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Unit_FreePromotions
WHERE UnitType = 'UNIT_HUN_HORSE_ARCHER'  AND PromotionType = 'PROMOTION_ACCURACY_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HUN_HORSE_ARCHER', 'PROMOTION_ROUGH_TERRAIN_ENDS_TURN'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'The fearsome cavalry of the Classical world, renowned for its skill in archery, and its mastery of horsemanship. Units like these were the scourge of Eurasia during the nomadic conquests of the 4th-15th centuries AD. Utilizing powerful composite bows, these mounted archers honed their skills while hunting, and they had no trouble carrying over these skills into warfare. It is widely believed that the use of mounted archers greatly influenced the future military considerations of both European and Asian kingdoms, as a greater emphasis on cavalry units arose following nomadic incursions during this period.'
WHERE Tag = 'TXT_KEY_CIV5_HUN_HORSE_ARCHER_TEXT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );
	
UPDATE Language_en_US
SET Text = 'A fast Ranged Unit used for hit-and-run attacks. Highly effective on flat ground, but slowed significantly when entering rough terrain. Requires 1 [ICON_RES_HORSE] Horse.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Horse Archers are fast ranged units, deadly on open terrain. Like the Chariot Archer, they cannot move through rough terrain without a movement penalty. As a mounted unit, the Horse Archer is vulnerable to Spearmen.'
WHERE Tag = 'TXT_KEY_UNIT_HUN_HORSE_ARCHER_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Changes to other units in this line.

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_HORSE_ARCHER'
WHERE Type = 'UNIT_CHARIOT_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_HORSE_ARCHER'
WHERE Type = 'UNIT_EGYPTIAN_WARCHARIOT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_HORSE_ARCHER'
WHERE UnitType = 'UNIT_CHARIOT_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_MATHEMATICS'
WHERE Type = 'UNIT_CHARIOT_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_PHYSICS'
WHERE Type = 'UNIT_EGYPTIAN_WARCHARIOT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_HORSE_ARCHER'
WHERE UnitType = 'UNIT_EGYPTIAN_WARCHARIOT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_MOUNTED_BOWMAN'
WHERE Type = 'UNIT_INDIAN_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET Class = 'UNITCLASS_HORSE_ARCHER'
WHERE Type = 'UNIT_INDIAN_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_MOUNTED_BOWMAN'
WHERE UnitType = 'UNIT_INDIAN_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_UnitClassOverrides
Set UnitClassType = 'UNITCLASS_HORSE_ARCHER'
WHERE UnitType = 'UNIT_INDIAN_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_PHYSICS'
WHERE Type = 'UNIT_INDIAN_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Boudicca -- Boost Ceilidh Hall -- Move to Medieval, add faith
UPDATE Buildings
SET PrereqTech = 'TECH_PHYSICS'
WHERE Type = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_CIRCUS'
WHERE Type = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_CEILIDH_HALL_HELP'
WHERE Type = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

INSERT INTO Language_en_US (Tag, Text)
SELECT 'TXT_KEY_BUILDING_CEILIDH_HALL_HELP', 'Reduces [ICON_HAPPINESS_3] Boredom, and provides a modest sum of [ICON_CULTURE] Culture when completed.[NEWLINE] Nearby [ICON_RES_IVORY] Ivory: +3 [ICON_CULTURE] Culture.'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
SELECT 'BUILDING_CEILIDH_HALL', 'RESOURCE_IVORY' , 'YIELD_CULTURE' , '3'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_CEILIDH_HALL' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET Happiness = '1'
WHERE Type = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MUSICIAN'
WHERE Type = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_CIRCUS'
WHERE BuildingType = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Building_ClassesNeededInCity
Set BuildingClassType = 'BUILDINGCLASS_COLOSSEUM'
WHERE BuildingType = 'BUILDING_CEILIDH_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );
	
UPDATE Language_en_US
SET Text = 'The Ceilidh Hall is a Medieval-era building unique to the Celts, replacing the Circus. Reduces [ICON_HAPPINESS_3] Boredom slightly and increases City [ICON_CULTURE] Culture and [ICON_PEACE] Faith. Nearby sources of Ivory gain +3 [ICON_CULTURE] Culture. Provides 1 Musician Specialist slot, and contains a slot for a Great Work of Music.'
WHERE Tag = 'TXT_KEY_BUILDING_CEILIDH_HALL_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );
	
UPDATE Language_en_US
SET Text = 'Has a unique set of Pantheon Beliefs. Cities with your Pantheon or founded Religion generate nor receive foreign Religious Pressure. +3 [ICON_PEACE] Faith in owned Cities where your Pantheon (or Religion, if a Founder) is the majority.'
WHERE Tag = 'TXT_KEY_TRAIT_FAITH_FROM_NATURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Only the Celts may build this unit. Double movement and +25% defense in Hills, Snow, and Tundra. Can pillage enemy improvements at no additional movement cost, and earns 200% of opponents'' strength as [ICON_PEACE] Faith for kills.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CELT_PICTISH_WARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET UniqueBeliefsOnly = 'true'
WHERE Type = 'TRAIT_FAITH_FROM_NATURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET NoNaturalReligionSpread = 'true'
WHERE Type = 'TRAIT_FAITH_FROM_NATURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET FaithFromUnimprovedForest = 'false'
WHERE Type = 'TRAIT_FAITH_FROM_NATURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_YieldFromKills
SET Yield = '200'
WHERE UnitType = 'UNIT_CELT_PICTISH_WARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_FreePromotions
SET PromotionType = 'PROMOTION_SKI_INFANTRY'
WHERE UnitType = 'UNIT_CELT_PICTISH_WARRIOR' AND PromotionType = 'PROMOTION_FOREIGN_LANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET PrereqTech = 'TECH_MINING'
WHERE Type = 'UNIT_CELT_PICTISH_WARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET Combat = '13'
WHERE Type = 'UNIT_CELT_PICTISH_WARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );


-- Dido -- Delete African Forest Elephant, remove mountain bonus (given to incans)
UPDATE Language_en_US
SET Text = 'Cities produce a large sum of [ICON_GOLD] Gold when founded. Bonus scales with Era. All owned coastal Cities receive a free Harbor.'
WHERE Tag = 'TXT_KEY_TRAIT_PHOENICIAN_HERITAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
Set CrossesMountainsAfterGreatGeneral = '0'
WHERE Type = 'TRAIT_PHOENICIAN_HERITAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Units
WHERE Type = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );



DELETE FROM Civilization_UnitClassOverrides
WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Unit_AITypes
WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Unit_ClassUpgrades
WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Unit_FreePromotions
WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Unit_Flavors
WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM UnitGameplay2DScripts
WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Gustavus Adolphus -- Remove Hakkepillita, add unique Public School
DELETE FROM Units
WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );



DELETE FROM Civilization_UnitClassOverrides
WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Remove Sweden Tundra bias

DELETE FROM Civilization_Start_Region_Priority
WHERE CivilizationType = 'CIVILIZATION_SWEDEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET GreatPersonGiftInfluence = '0'
WHERE Type = 'TRAIT_DIPLOMACY_GREAT_PEOPLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET DOFGreatPersonModifier = '0'
WHERE Type = 'TRAIT_DIPLOMACY_GREAT_PEOPLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET InspirationalLeader = 'true'
WHERE Type = 'TRAIT_DIPLOMACY_GREAT_PEOPLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Land melee units receive +15% [ICON_STRENGTH] Strength when Attacking, and Siege Units gain +1 [ICON_MOVES] Movement. If a [ICON_GREAT_GENERAL] Great General is born while at war, all Military Units are healed and receive +15 XP.'
WHERE Tag = 'TXT_KEY_TRAIT_DIPLOMACY_GREAT_PEOPLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Lion of the North'
WHERE Tag = 'TXT_KEY_TRAIT_DIPLOMACY_GREAT_PEOPLE_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_MUSKETMAN'
WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_RIFLEMAN'
WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN'
WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Selassie -- Peace Treaty Bonuss

UPDATE Language_en_US
SET Text = 'When you complete a Policy Branch, adopt a Belief, or choose your first Ideology, receive a free Technology.'
WHERE Tag = 'TXT_KEY_TRAIT_BONUS_AGAINST_TECH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Solomonic Wisdom'
WHERE Tag = 'TXT_KEY_TRAIT_BONUS_AGAINST_TECH_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET IsAdoptionFreeTech = 'true'
WHERE Type = 'TRAIT_BONUS_AGAINST_TECH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET CombatBonusVsLargerCiv = '0'
WHERE Type = 'TRAIT_BONUS_AGAINST_TECH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_ETHIOPIAN_MEHAL_SEFARI' , 'PROMOTION_HOMELAND_GUARDIAN'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Strong, front-line land Unit that specializes in fighting in Friendly Territory, especially when defending near the Ethiopian capital. Only the Ethiopians may build it.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MEHAL_SEFARI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '2'
WHERE BuildingType = 'BUILDING_STELE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_STELE_HELP'
WHERE Type = 'BUILDING_STELE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

UPDATE Buildings
SET PlotCultureCostModifier = '-33'
WHERE Type = 'BUILDING_STELE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );
 
INSERT INTO Language_en_US (Tag, Text)
SELECT 'TXT_KEY_BUILDING_STELE_HELP', '[ICON_CULTURE] Culture costs of acquiring new tiles reduced by 33% in this city. +25% [ICON_PEACE] Faith during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );
	
-- Theodora -- Basilica UB (Replace Dromon)
DELETE FROM Civilization_UnitClassOverrides
WHERE UnitType = 'UNIT_BYZANTINE_DROMON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Is always eligible to found a Religion, and receives an additional Belief when founding a Religion. Is allowed to choose from Beliefs already in other Religions.'
WHERE Tag = 'TXT_KEY_TRAIT_EXTRA_BELIEF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET AnyBelief = 'true'
WHERE Type = 'TRAIT_EXTRA_BELIEF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET AlwaysReligion = 'true'
WHERE Type = 'TRAIT_EXTRA_BELIEF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Cataphract Lasts Longer
UPDATE Units
SET ObsoleteTech = 'TECH_METALLURGY'
WHERE Type = 'UNIT_BYZANTINE_CATAPHRACT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET PrereqTech = 'TECH_ARCHERY'
WHERE Type = 'UNIT_BYZANTINE_CATAPHRACT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- William -- Change Polder (more gold, less food) -- New Trait
UPDATE Traits
SET LuxuryHappinessRetention = '0'
WHERE Type = 'TRAIT_LUXURY_RETENTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Improvements
SET FreshWaterMakesValid = '1'
WHERE Type = 'IMPROVEMENT_POLDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Improvements
SET RequiresFeature = 'false'
WHERE Type = 'IMPROVEMENT_POLDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Improvement_ValidFeatures
WHERE ImprovementType = 'IMPROVEMENT_POLDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Improvement_Yields
SET Yield = '3'
WHERE ImprovementType = 'IMPROVEMENT_POLDER' AND YieldType = 'YIELD_FOOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = '+4 [ICON_CULTURE] Culture for each different Luxury Resource you import from other Civilizations and City-States, +4 [ICON_GOLD] Gold for each different Luxury Resource you export to other Civilizations. Bonuses scale with Era.'
WHERE Tag = 'TXT_KEY_TRAIT_LUXURY_RETENTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'A Polder can be built on tiles with access to fresh water. It generates [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production, and grants [ICON_GOLD] Gold to adjacent Villages and Towns. Provides additional yields once later techs are researched.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Maria Theresa -- Coffee House +2 Production, +2 Food.

UPDATE Language_en_US
SET Text = 'Use [ICON_GOLD] Gold to arrange Marriages to City-States. While at peace with the City-State, Marriages eliminate [ICON_INFLUENCE] Influence decay, grant +1 Delegate to World Congress, and +10% [ICON_GREAT_PEOPLE] Great Person Rate in your [ICON_CAPITAL] Capital.'
WHERE Tag = 'TXT_KEY_TRAIT_ANNEX_CITY_STATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Habsburg Diplomacy'
WHERE Tag = 'TXT_KEY_TRAIT_ANNEX_CITY_STATE_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET DiplomaticMarriage = 'true'
WHERE Type = 'TRAIT_ANNEX_CITY_STATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET AbleToAnnexCityStates = '0'
WHERE Type = 'TRAIT_ANNEX_CITY_STATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingProductionModifier = '0'
WHERE Type = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET GreatPeopleRateModifier = '33'
WHERE Type = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET FoodKept = '25'
WHERE Type = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Building_YieldChanges
SET YieldType = 'YIELD_FOOD'
WHERE BuildingType = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_GROCER'
WHERE BuildingType = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_GROCER'
WHERE Type = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT'
WHERE Type = 'BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = '+33% [ICON_GREAT_PEOPLE] Great People generation in this City, and +25 [ICON_GOLD] Gold (scaling with Era) when a [ICON_GREAT_PEOPLE] Great Person is born.[NEWLINE][NEWLINE]Carries over 25% of [ICON_FOOD] Food after City growth (effect stacks with Aqueduct), and reduces [ICON_HAPPINESS_3] Poverty.[NEWLINE][NEWLINE]Requires an Aqueduct in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_COFFEE_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'The Coffee House is a Renaissance-era building unique to Austria, replacing the Grocer. It increases the city''s [ICON_GROWTH] Growth and speed at which [ICON_GREAT_PEOPLE] Great People are generated by 33%.'
WHERE Tag = 'TXT_KEY_BUILDING_COFFEE_HOUSE_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Maya -- Move Pyramid to Agriculture, Bring UA back to Mathematics

UPDATE Traits
SET PrereqTech = 'TECH_MATHEMATICS'
WHERE Type = 'TRAIT_LONG_COUNT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'After researching Mathematics, receive a bonus Great Person at the end of every Maya Long Count cycle (every 394 years). Each bonus person can only be chosen once.'
WHERE Tag = 'TXT_KEY_TRAIT_LONG_COUNT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Buff Atlatl, move to Classical Age
-- Eki

INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_KUNA', 'Improvement', 'Kuna';

INSERT INTO ArtDefine_Landmarks (Era, State, Scale,	ImprovementType,					LayoutHandler,	ResourceType,					Model,						TerrainContour) VALUES
('Any', 'UnderConstruction',	0.4,  				'ART_DEF_IMPROVEMENT_KUNA',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'hb_kuna.fxsxml',			1	),
('Any', 'Constructed',			0.4,  				'ART_DEF_IMPROVEMENT_KUNA',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'kuna.fxsxml',				1	),
('Any', 'Pillaged',				0.4,  				'ART_DEF_IMPROVEMENT_KUNA',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'pl_kuna.fxsxml',			1	);

DELETE FROM Buildings
WHERE Type = 'BUILDING_MAYA_PYRAMID';

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MAYA_PYRAMID';

DELETE FROM Civilization_BuildingClassOverrides
WHERE BuildingType = 'BUILDING_MAYA_PYRAMID';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CROSSBOWMAN'
WHERE Type = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CROSSBOWMAN'
WHERE UnitType = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_UnitClassOverrides
Set UnitClassType = 'UNITCLASS_COMPOSITE_BOWMAN'
WHERE UnitType = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET PrereqTech = 'TECH_MATHEMATICS'
WHERE Type = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET ObsoleteTech = 'TECH_RIFLING'
WHERE Type = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET Class = 'UNITCLASS_COMPOSITE_BOWMAN'
WHERE Type = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Units
SET Combat = '5'
WHERE Type = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Units
SET RangedCombat = '11'
WHERE Type = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Unit_Flavors
SET Flavor = '15'
WHERE UnitType = 'UNIT_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Only the Maya may build this unit. It is available sooner than the Composite Bowman, which it replaces, and can attack twice.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MAYAN_ATLATLIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'The Atlatlist is the Mayan unique unit, replacing the Composite Bowman. Atlatlists are both cheaper than a Composite Bowman, available earlier, and can attack twice. This advantage allows your archers to engage in hit-and-run skirmish tactics.'
WHERE Tag = 'TXT_KEY_UNIT_MAYAN_ATLATLIST_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_Start_Region_Priority
SET RegionType = 'REGION_JUNGLE'
WHERE CivilizationType = 'CIVILIZATION_MAYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );