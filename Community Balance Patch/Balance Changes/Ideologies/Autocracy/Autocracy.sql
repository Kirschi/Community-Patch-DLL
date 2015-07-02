-- Clausewitz's Legacy

UPDATE Policies
SET NumFreePolicies = '1'
WHERE Type = 'POLICY_NEW_ORDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET WarWearinessModifier = '50'
WHERE Type = 'POLICY_NEW_ORDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Cult of Personality 

UPDATE Policies
SET NumFreeGreatPeople = '1'
WHERE Type = 'POLICY_CULT_PERSONALITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET IncludesOneShotFreeUnits = '1'
WHERE Type = 'POLICY_CULT_PERSONALITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Elite Forces
UPDATE Policies
SET ExpModifier = '50'
WHERE Type = 'POLICY_ELITE_FORCES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET FreeExperience = '15'
WHERE Type = 'POLICY_ELITE_FORCES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET WoundedUnitDamageMod = '0'
WHERE Type = 'POLICY_ELITE_FORCES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Fortified Borders

DELETE FROM Policy_BuildingClassHappiness
WHERE PolicyType = 'POLICY_FORTIFIED_BORDERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET DefenseHappinessMod = '-25'
WHERE Type = 'POLICY_FORTIFIED_BORDERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Futurism

-- Industrial Espionage (now Lebensraum)
UPDATE Policies
SET StealTechFasterModifier = '0'
WHERE Type = 'POLICY_INDUSTRIAL_ESPIONAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET CitadelBoost = '1'
WHERE Type = 'POLICY_INDUSTRIAL_ESPIONAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Lightning Warfare

-- Militarism

DELETE FROM Policy_BuildingClassHappiness
WHERE PolicyType = 'POLICY_MILITARISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET Level = '3'
WHERE Type = 'POLICY_MILITARISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Mobilization
UPDATE Policies
SET UnitUpgradeCostMod = '-25'
WHERE Type = 'POLICY_MOBILIZATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Police State

-- Third Alternative

UPDATE Policy_CapitalYieldChanges
SET Yield = '10'
WHERE PolicyType = 'POLICY_THIRD_ALTERNATIVE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Total War
UPDATE Policies
SET FreeExperience = '0'
WHERE Type = 'POLICY_TOTAL_WAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET WorkerSpeedModifier = '25'
WHERE Type = 'POLICY_TOTAL_WAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- United Front
UPDATE Policies
SET MilitaryUnitGiftExtraInfluence = '10'
WHERE Type = 'POLICY_UNITED_FRONT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET CityStateUnitFrequencyModifier = '200'
WHERE Type = 'POLICY_UNITED_FRONT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Autarky

DELETE FROM Policy_BuildingClassHappiness
WHERE PolicyType = 'POLICY_UNIVERSAL_HEALTHCARE_A' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET InternalTradeGold = '10'
WHERE Type = 'POLICY_UNIVERSAL_HEALTHCARE_A' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_UNIVERSAL_HEALTHCARE_A_HELP'
WHERE Type = 'POLICY_UNIVERSAL_HEALTHCARE_A' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET Description = 'TXT_KEY_POLICY_UNIVERSAL_HEALTHCARE_A'
WHERE Type = 'POLICY_UNIVERSAL_HEALTHCARE_A' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET Civilopedia = 'TXT_KEY_POLICY_UNIVERSAL_HEALTHCARE_TEXT_A'
WHERE Type = 'POLICY_UNIVERSAL_HEALTHCARE_A' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Gunboat Diplomacy
UPDATE Policies
SET Level = '2'
WHERE Type = 'POLICY_GUNBOAT_DIPLOMACY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );
