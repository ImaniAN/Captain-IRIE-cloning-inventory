-- Insert data into SeedBreederVendor Table
INSERT INTO SeedBreederVendor (VendorName)
VALUES
    ('MarijuanaSouthAfrica'),
    ('GrowWeedAfrica'),
    ('BagSeeds');

-- Insert data into GeneticMarker Table
INSERT INTO GeneticMarker (Genus, Species)
VALUES
    ('Cannabis', 'Sativa'),
    ('Cannabis', 'Indica'),
    ('Cannabis', 'Hybrid');

-- Insert data into Strain Table
INSERT INTO Strain (NickName, FirstName, MiddleName, LastName, BreederVendorID, GeneticMarkerID) --Mock data reflects 3 species from 3 "real clients"
VALUES
    ('Strain1', 'FirstS', 'MiddleMSA', 'Last1', 1, 1), -- Strain1 is a Sativa from MarijuanaSouthAfrica
    ('Strain2', 'FirstS', 'MiddleGWA', 'Last2', 2, 1), -- Strain2 is a Sativa from GrowWeedAfrica
    ('Strain3', 'FirstS', 'MiddleBS', 'Last3', 3, 1), -- Strain3 is a Sativa from BagSeeds
    ('Strain4', 'FirstI', 'MiddleMSA', 'Last1', 1, 2), -- Strain4 is a Indica from MarijuanaSouthAfrica
    ('Strain5', 'FirstI', 'MiddleGWA', 'Last2', 2, 2), -- Strain5 is a Indica from GrowWeedAfrica
    ('Strain6', 'FirstI', 'MiddleBS', 'Last3', 3, 2), -- Strain6 is a Indica from BagSeeds
    ('Strain7', 'FirstH', 'MiddleMSA', 'Last1', 1, 3), -- Strain7 is a Hybrid from MarijuanaSouthAfrica
    ('Strain8', 'FirstH', 'MiddleGWA', 'Last2', 2, 3), -- Strain8 is a Hybrid from GrowWeedAfrica
    ('Strain9', 'FirstH', 'MiddleBS', 'Last3', 3, 3); -- Strain9 is a Hybrid from BagSeeds

-- Insert data into StrainSeedBag Table
INSERT INTO StrainSeedBag (StrainSeedBagName, PackageUnits, DateReceived, StrainID)
VALUES
    ('BagSeeds1', 3, '2023-01-11', 1),  -- BagSeeds1 is a Sativa from MarijuanaSouthAfrica
    ('BagSeeds2', 3, '2023-01-11', 4),  -- BagSeeds2 is an Indica from MarijuanaSouthAfrica
    ('BagSeeds3', 3, '2023-01-11', 7),  -- BagSeeds3 is a Hybrid from MarijuanaSouthAfrica
    ('SeedPack1', 3, '2023-01-11', 2),  -- SeedPack1 is a Sativa from GrowWeedAfrica
    ('SeedPack2', 3, '2023-01-11', 5),  -- SeedPack2 is an Indica from GrowWeedAfrica
    ('SeedPack3', 3, '2023-01-11', 8),  -- SeedPack3 is a Hybrid from GrowWeedAfrica
    ('SeedPack4', 3, '2023-02-15', 3),  -- SeedPack4 is a Sativa from BagSeeds
    ('SeedPack5', 3, '2023-02-15', 6),  -- SeedPack5 is an Indica from BagSeeds
    ('SeedPack6', 3, '2023-03-20', 9);  -- SeedPack6 is a Hybrid from BagSeeds

-- Insert data into Seed Table
INSERT INTO Seed (StrainSeedBagID)
VALUES
    -- For StrainSeedBag 1 (BagSeeds1) has 3 entries for each seed in a bag
    (1),   -- Seed 1
    (1),   -- Seed 2
    (1),   -- Seed 3
    -- For StrainSeedBag 2 (BagSeeds2) has 3 entries for each seed in a bag
    (2),   -- Seed 4
    (2),   -- Seed 5
    (2),   -- Seed 6
    -- For StrainSeedBag 3 (BagSeeds3) has 3 entries for each seed in a bag
    (3),   -- Seed 7
    (3),   -- Seed 8
    (3),   -- Seed 9
    -- For StrainSeedBag 4 (SeedPack1) has 3 entries for each seed in a bag
    (4),   -- Seed 10
    (4),   -- Seed 11
    (4),   -- Seed 12
    -- For StrainSeedBag 5 (SeedPack2) has 3 entries for each seed in a bag
    (5),   -- Seed 13
    (5),   -- Seed 14
    (5),   -- Seed 15
    -- For StrainSeedBag 6 (SeedPack3) has 3 entries for each seed in a bag
    (6),   -- Seed 16
    (6),   -- Seed 17
    (6),   -- Seed 18
    -- For StrainSeedBag 7 (SeedPack4) has 3 entries for each seed in a bag
    (7),   -- Seed 19
    (7),   -- Seed 20
    (7),   -- Seed 21
    -- For StrainSeedBag 8 (SeedPack5) has 3 entries for each seed in a bag
    (8),   -- Seed 22
    (8),   -- Seed 23
    (8),   -- Seed 24
    -- For StrainSeedBag 9 (SeedPack6) has 3 entries for each seed in a bag
    (9),   -- Seed 25
    (9),   -- Seed 26
    (9);   -- Seed 27

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SproutDate)
VALUES
    -- For Seed 1 (in StrainSeedBag 1)
    (1, '2023-01-07'),
    -- For Seed 2 (in StrainSeedBag 1)
    (2, '2023-01-07'),
    -- For Seed 3 (in StrainSeedBag 1)
    (3, '2023-01-07'),
    -- For Seed 4 (in StrainSeedBag 2)
    (4, '2023-01-07'),
    -- For Seed 5 (in StrainSeedBag 2)
    (5, '2023-01-07'),
    -- For Seed 6 (in StrainSeedBag 2)
    (6, '2023-01-07'),
    -- For Seed 7 (in StrainSeedBag 3)
    (7, '2023-01-07'),
    -- For Seed 8 (in StrainSeedBag 3)
    (8, '2023-01-07'),
    -- For Seed 9 (in StrainSeedBag 3)
    (9, '2023-01-07'),
    -- For Seed 10 (in StrainSeedBag 4)
    (10, '2023-01-07'),
    -- For Seed 11 (in StrainSeedBag 4)
    (11, '2023-01-07'),
    -- For Seed 12 (in StrainSeedBag 4)
    (12, '2023-01-07'),
    -- For Seed 13 (in StrainSeedBag 5)
    (13, '2023-01-07'),
    -- For Seed 14 (in StrainSeedBag 5)
    (14, '2023-01-07'),
    -- For Seed 15 (in StrainSeedBag 5)
    (15, '2023-01-07'),
    -- For Seed 16 (in StrainSeedBag 6)
    (16, '2023-01-07'),
    -- For Seed 17 (in StrainSeedBag 6)
    (17, '2023-01-07'),
    -- For Seed 18 (in StrainSeedBag 6)
    (18, '2023-01-07'),
    -- For Seed 19 (in StrainSeedBag 7)
    (19, '2023-01-07'),
    -- For Seed 20 (in StrainSeedBag 7)
    (20, '2023-01-07'),
    -- For Seed 21 (in StrainSeedBag 7)
    (21, '2023-01-07'),
    -- For Seed 22 (in StrainSeedBag 8)
    (22, '2023-01-07'),
    -- For Seed 23 (in StrainSeedBag 8)
    (23, '2023-01-07'),
    -- For Seed 24 (in StrainSeedBag 8)
    (24, '2023-01-07'),
    -- For Seed 25 (in StrainSeedBag 9)
    (25, '2023-01-07'),
    -- For Seed 26 (in StrainSeedBag 9)
    (26, '2023-01-07'),
    -- For Seed 27 (in StrainSeedBag 9)
    (27, '2023-01-07');

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SproutDate)
VALUES
    (1, '2023-01-07'),   -- Seedling 1
    (2, '2023-01-07'),   -- Seedling 2
    (3, '2023-01-07'),   -- Seedling 3
    (4, '2023-01-07'),   -- Seedling 4
    (5, '2023-01-07'),   -- Seedling 5
    (6, '2023-01-07'),   -- Seedling 6
    (7, '2023-01-07'),   -- Seedling 7
    (8, '2023-01-07'),   -- Seedling 8
    (9, '2023-01-07'),   -- Seedling 9
    (10, '2023-01-07'),  -- Seedling 10
    (11, '2023-01-07'),  -- Seedling 11
    (12, '2023-01-07'),  -- Seedling 12
    (13, '2023-01-07'),  -- Seedling 13
    (14, '2023-01-07'),  -- Seedling 14
    (15, '2023-01-07'),  -- Seedling 15
    (16, '2023-01-07'),  -- Seedling 16
    (17, '2023-01-07'),  -- Seedling 17
    (18, '2023-01-07'),  -- Seedling 18
    (19, '2023-01-07'),  -- Seedling 19
    (20, '2023-01-07'),  -- Seedling 20
    (21, '2023-01-07'),  -- Seedling 21
    (22, '2023-01-07'),  -- Seedling 22
    (23, '2023-01-07'),  -- Seedling 23
    (24, '2023-01-07'),  -- Seedling 24
    (25, '2023-01-07'),  -- Seedling 25
    (26, '2023-01-07'),  -- Seedling 26
    (27, '2023-01-07');  -- Seedling 27

-- Insert data into Mothers Table
-- SproutDate + 60 days = DateMothered (2023-02-07)
INSERT INTO Mothers (SeedlingID, DateMothered)
VALUES
    (1, '2023-02-07'),   -- Mother 1
    (2, '2023-02-07'),   -- Mother 2
    (3, '2023-02-07'),   -- Mother 3
    (4, '2023-02-07'),   -- Mother 4
    (5, '2023-02-07'),   -- Mother 5
    (6, '2023-02-07'),   -- Mother 6
    (7, '2023-02-07'),   -- Mother 7
    (8, '2023-02-07'),   -- Mother 8
    (9, '2023-02-07'),   -- Mother 9
    (10, '2023-02-07'), -- Mother 10
    (11, '2023-02-07'), -- Mother 11
    (12, '2023-02-07'), -- Mother 12
    (13, '2023-02-07'), -- Mother 13
    (14, '2023-02-07'), -- Mother 14
    (15, '2023-02-07'), -- Mother 15
    (16, '2023-02-07'), -- Mother 16
    (17, '2023-02-07'), -- Mother 17
    (18, '2023-02-07'), -- Mother 18
    (19, '2023-02-07'), -- Mother 19
    (20, '2023-02-07'), -- Mother 20
    (21, '2023-02-07'), -- Mother 21
    (22, '2023-02-07'), -- Mother 22
    (23, '2023-02-07'), -- Mother 23
    (24, '2023-02-07'), -- Mother 24
    (25, '2023-02-07'), -- Mother 25
    (26, '2023-02-07'), -- Mother 26
    (27, '2023-02-07'); -- Mother 27


-- Insert data into Maturity Table
-- there are 27 mothers
-- (2023-02-10) = DateOfMaturityCheck because each initial maturity check must happen within 3 days of being a mother for cutting.
-- every maturity check after must happen 3 weeks from that date
-- each mother will get 4 maturity checks each spaced out by 3 weeks (108 entries in total)
-- Height = 70
-- NumberOfBranches = 18
-- LeafColour = Green (Dark)
-- Insert data into Maturity Table
INSERT INTO Maturity (MotherID, DateOfMaturityCheck, Height, NumberOfBranches)
VALUES
    -- Mother 1 Maturity Checks
    (1, '2023-02-10', 70, 13),  -- Entry 1
    (1, '2023-03-03', 85, 13),  -- Entry 2
    (1, '2023-03-24', 102, 13),  -- Entry 3

    -- Mother 2 Maturity Checks
    (2, '2023-02-10', 40, 13),  -- Entry 4
    (2, '2023-03-03', 48, 13),  -- Entry 5
    (2, '2023-03-24', 58, 13),  -- Entry 6

    -- Mother 3 Maturity Checks
    (3, '2023-02-10', 50, 13),  -- Entry 7
    (3, '2023-03-03', 60, 13),  -- Entry 8
    (3, '2023-03-24', 63, 13),  -- Entry 9

    -- Mother 4 Maturity Checks
    (4, '2023-02-10', 70, 13),  -- Entry 10
    (4, '2023-03-03', 70, 13),  -- Entry 11
    (4, '2023-03-24', 70, 13),  -- Entry 12

    -- Mother 5 Maturity Checks
    (5, '2023-02-10', 70, 13),  -- Entry 13
    (5, '2023-03-03', 70, 13),  -- Entry 14
    (5, '2023-03-24', 70, 13),  -- Entry 15

    -- Mother 6 Maturity Checks
    (6, '2023-02-10', 70, 13),  -- Entry 16
    (6, '2023-03-03', 70, 13),  -- Entry 17
    (6, '2023-03-24', 70, 13),  -- Entry 18

    -- Mother 7 Maturity Checks
    (7, '2023-02-10', 70, 13),  -- Entry 19
    (7, '2023-03-03', 70, 13),  -- Entry 20
    (7, '2023-03-24', 70, 13),  -- Entry 21

    -- Mother 8 Maturity Checks
    (8, '2023-02-10', 70, 13),  -- Entry 22
    (8, '2023-03-03', 70, 13),  -- Entry 23
    (8, '2023-03-24', 70, 13),  -- Entry 24

    -- Mother 9 Maturity Checks
    (9, '2023-02-10', 70, 13),  -- Entry 25
    (9, '2023-03-03', 70, 13),  -- Entry 26
    (9, '2023-03-24', 70, 13),  -- Entry 27

    -- Mother 10 Maturity Checks
    (10, '2023-02-10', 70, 13),  -- Entry 28
    (10, '2023-03-03', 70, 13),  -- Entry 29
    (10, '2023-03-24', 70, 13),  -- Entry 30

    -- Mother 11 Maturity Checks
    (11, '2023-02-10', 70, 13),  -- Entry 31
    (11, '2023-03-03', 70, 13),  -- Entry 32
    (11, '2023-03-24', 70, 13),  -- Entry 33

    -- Mother 12 Maturity Checks
    (12, '2023-02-10', 70, 13),  -- Entry 34
    (12, '2023-03-03', 70, 13),  -- Entry 35
    (12, '2023-03-24', 70, 13),  -- Entry 36

    -- Mother 13 Maturity Checks
    (13, '2023-02-10', 70, 13),  -- Entry 37
    (13, '2023-03-03', 70, 13),  -- Entry 38
    (13, '2023-03-24', 70, 13),  -- Entry 39

    -- Mother 14 Maturity Checks
    (14, '2023-02-10', 70, 13),  -- Entry 40
    (14, '2023-03-03', 70, 13),  -- Entry 41
    (14, '2023-03-24', 70, 13),  -- Entry 42

    -- Mother 15 Maturity Checks
    (15, '2023-02-10', 70, 13),  -- Entry 43
    (15, '2023-03-03', 70, 13),  -- Entry 44
    (15, '2023-03-24', 70, 13),  -- Entry 45

    -- Mother 16 Maturity Checks
    (16, '2023-02-10', 70, 13),  -- Entry 46
    (16, '2023-03-03', 70, 13),  -- Entry 47
    (16, '2023-03-24', 70, 13),  -- Entry 48

    -- Mother 17 Maturity Checks
    (17, '2023-02-10', 70, 13),  -- Entry 49
    (17, '2023-03-03', 70, 13),  -- Entry 50
    (17, '2023-03-24', 70, 13),  -- Entry 51

    -- Mother 18 Maturity Checks
    (18, '2023-02-10', 70, 13),  -- Entry 52
    (18, '2023-03-03', 70, 13),  -- Entry 53
    (18, '2023-03-24', 70, 13),  -- Entry 54

    -- Mother 19 Maturity Checks
    (19, '2023-02-10', 70, 13),  -- Entry 55
    (19, '2023-03-03', 70, 13),  -- Entry 56
    (19, '2023-03-24', 70, 13),  -- Entry 57

    -- Mother 20 Maturity Checks
    (20, '2023-02-10', 70, 13),  -- Entry 58
    (20, '2023-03-03', 70, 13),  -- Entry 59
    (20, '2023-03-24', 70, 13),  -- Entry 60

    -- Mother 21 Maturity Checks
    (21, '2023-02-10', 70, 13),  -- Entry 61
    (21, '2023-03-03', 70, 13),  -- Entry 62
    (21, '2023-03-24', 70, 13),  -- Entry 63

    -- Mother 22 Maturity Checks
    (22, '2023-02-10', 70, 13),  -- Entry 64
    (22, '2023-03-03', 70, 13),  -- Entry 65
    (22, '2023-03-24', 70, 13),  -- Entry 66

    -- Mother 23 Maturity Checks
    (23, '2023-02-10', 70, 13),  -- Entry 67
    (23, '2023-03-03', 70, 13),  -- Entry 68
    (23, '2023-03-24', 70, 13),  -- Entry 69

    -- Mother 24 Maturity Checks
    (24, '2023-02-10', 70, 13),  -- Entry 70
    (24, '2023-03-03', 70, 13),  -- Entry 71
    (24, '2023-03-24', 70, 13),  -- Entry 72

    -- Mother 25 Maturity Checks
    (25, '2023-02-10', 70, 13),  -- Entry 73
    (25, '2023-03-03', 70, 13),  -- Entry 74
    (25, '2023-03-24', 70, 13),  -- Entry 75

    -- Mother 26 Maturity Checks
    (26, '2023-02-10', 70, 13),  -- Entry 76
    (26, '2023-03-03', 70, 13),  -- Entry 77
    (26, '2023-03-24', 70, 13),  -- Entry 78

    -- Mother 27 Maturity Checks
    (27, '2023-02-10', 70, 13),  -- Entry 79
    (27, '2023-03-03', 70, 13),  -- Entry 80
    (27, '2023-03-24', 70, 13);  -- Entry 81

-- Insert data into Cutting Table
INSERT INTO Cutting (MaturityID, NumberOfCuts, CutDate)
    -- Mother 1 cutting entries
    (1, 5, '2023-02-10'),
    (1, 5, '2023-03-03'),
    (1, 5, '2023-03-24'),

    -- Mother 2 cutting entries
    (2, 5, '2023-02-10'),
    (2, 5, '2023-03-03'),
    (2, 5, '2023-03-24'),

    -- Mother 3 cutting entries
    (3, 5, '2023-02-10'),
    (3, 5, '2023-03-03'),
    (3, 5, '2023-03-24'),

    -- Mother 4 cutting entries
    (4, 5, '2023-02-10'),
    (4, 5, '2023-03-03'),
    (4, 5, '2023-03-24'),

    -- Mother 5 cutting entries
    (5, 5, '2023-02-10'),
    (5, 5, '2023-03-03'),
    (5, 5, '2023-03-24'),

    -- Mother 6 cutting entries
    (6, 5, '2023-02-10'),
    (6, 5, '2023-03-03'),
    (6, 5, '2023-03-24'),

    -- Mother 7 cutting entries
    (7, 5, '2023-02-10'),
    (7, 5, '2023-03-03'),
    (7, 5, '2023-03-24'),

    -- Mother 8 cutting entries
    (8, 5, '2023-02-10'),
    (8, 5, '2023-03-03'),
    (8, 5, '2023-03-24'),

    -- Mother 9 cutting entries
    (9, 5, '2023-02-10'),
    (9, 5, '2023-03-03'),
    (9, 5, '2023-03-24'),

    -- Mother 10 cutting entries
    (10, 5, '2023-02-10'),
    (10, 5, '2023-03-03'),
    (10, 5, '2023-03-24'),

    -- Mother 11 cutting entries
    (11, 5, '2023-02-10'),
    (11, 5, '2023-03-03'),
    (11, 5, '2023-03-24'),

    -- Mother 12 cutting entries
    (12, 5, '2023-02-10'),
    (12, 5, '2023-03-03'),
    (12, 5, '2023-03-24'),

    -- Mother 13 cutting entries
    (13, 5, '2023-02-10'),
    (13, 5, '2023-03-03'),
    (13, 5, '2023-03-24'),

    -- Mother 14 cutting entries
    (14, 5, '2023-02-10'),
    (14, 5, '2023-03-03'),
    (14, 5, '2023-03-24'),

    -- Mother 15 cutting entries
    (15, 5, '2023-02-10'),
    (15, 5, '2023-03-03'),
    (15, 5, '2023-03-24'),

    -- Mother 16 cutting entries
    (16, 5, '2023-02-10'),
    (16, 5, '2023-03-03'),
    (16, 5, '2023-03-24'),

    -- Mother 17 cutting entries
    (17, 5, '2023-02-10'),
    (17, 5, '2023-03-03'),
    (17, 5, '2023-03-24'),

    -- Mother 18 cutting entries
    (18, 5, '2023-02-10'),
    (18, 5, '2023-03-03'),
    (18, 5, '2023-03-24'),

    -- Mother 19 cutting entries
    (19, 5, '2023-02-10'),
    (19, 5, '2023-03-03'),
    (19, 5, '2023-03-24'),

    -- Mother 20 cutting entries
    (20, 5, '2023-02-10'),
    (20, 5, '2023-03-03'),
    (20, 5, '2023-03-24'),

    -- Mother 21 cutting entries
    (21, 5, '2023-02-10'),
    (21, 5, '2023-03-03'),
    (21, 5, '2023-03-24'),

    -- Mother 22 cutting entries
    (22, 5, '2023-02-10'),
    (22, 5, '2023-03-03'),
    (22, 5, '2023-03-24'),

    -- Mother 23 cutting entries
    (23, 5, '2023-02-10'),
    (23, 5, '2023-03-03'),
    (23, 5, '2023-03-24'),

    -- Mother 24 cutting entries
    (24, 5, '2023-02-10'),
    (24, 5, '2023-03-03'),
    (24, 5, '2023-03-24'),

    -- Mother 25 cutting entries
    (25, 5, '2023-02-10'),
    (25, 5, '2023-03-03'),
    (25, 5, '2023-03-24'),

    -- Mother 26 cutting entries
    (26, 5, '2023-02-10'),
    (26, 5, '2023-03-03'),
    (26, 5, '2023-03-24'),

    -- Mother 27 cutting entries
    (27, 5, '2023-02-10'),
    (27, 5, '2023-03-03'),
    (27, 5, '2023-03-24');

-- Insert data into Transplant Table -- 3 cuttings * 16 cuts * 27 mothers = 1296transplat entries 
-- TransplantDate = CutDate + 13 days
-- 27 Mothers
-- 16 cuts per marutity check
-- 3 matruity checks per mother
INSERT INTO Transplant (CutID, TransplantDate)
VALUES
    -- Transplants from First cutting on Mother 1
    (1, '2023-02-26'),
    (1, '2023-02-26'),
    (1, '2023-02-26'),
    (1, '2023-02-26'),
    (1, '2023-02-26'),

    -- Transplants from Second cutting on Mother 1
    (2, '2023-03-11'),
    (2, '2023-03-11'),
    (2, '2023-03-11'),
    (2, '2023-03-11'),
    (2, '2023-03-11'),

    -- Transplants from Third cutting on Mother 1
    (3, '2023-03-24'),
    (3, '2023-03-24'),
    (3, '2023-03-24'),
    (3, '2023-03-24'),
    (3, '2023-03-24'),

    -- Transplants from First cutting on Mother 2
    (4, '2023-02-26'),
    (4, '2023-02-26'),
    (4, '2023-02-26'),
    (4, '2023-02-26'),
    (4, '2023-02-26'),

    -- Transplants from Second cutting on Mother 2
    (5, '2023-03-11'),
    (5, '2023-03-11'),
    (5, '2023-03-11'),
    (5, '2023-03-11'),
    (5, '2023-03-11'),

    -- Transplants from Third cutting on Mother 2
    (6, '2023-03-24'),
    (6, '2023-03-24'),
    (6, '2023-03-24'),
    (6, '2023-03-24'),
    (6, '2023-03-24'),

    -- Transplants from First cutting on Mother 3
    (7, '2023-02-26'),
    (7, '2023-02-26'),
    (7, '2023-02-26'),
    (7, '2023-02-26'),
    (7, '2023-02-26'),

    -- Transplants from Second cutting on Mother 3
    (8, '2023-03-11'),
    (8, '2023-03-11'),
    (8, '2023-03-11'),
    (8, '2023-03-11'),
    (8, '2023-03-11'),

    -- Transplants from Third cutting on Mother 3
    (9, '2023-03-24'),
    (9, '2023-03-24'),
    (9, '2023-03-24'),
    (9, '2023-03-24'),
    (9, '2023-03-24'),

    -- Transplants from First cutting on Mother 4
    (10, '2023-02-26'),
    (10, '2023-02-26'),
    (10, '2023-02-26'),
    (10, '2023-02-26'),
    (10, '2023-02-26'),

    -- Transplants from Second cutting on Mother 4
    (11, '2023-03-11'),
    (11, '2023-03-11'),
    (11, '2023-03-11'),
    (11, '2023-03-11'),
    (11, '2023-03-11'),

    -- Transplants from Third cutting on Mother 4
    (12, '2023-03-24'),
    (12, '2023-03-24'),
    (12, '2023-03-24'),
    (12, '2023-03-24'),
    (12, '2023-03-24'),

    -- Transplants from First cutting on Mother 5
    (13, '2023-02-26'),
    (13, '2023-02-26'),
    (13, '2023-02-26'),
    (13, '2023-02-26'),
    (13, '2023-02-26'),

    -- Transplants from Second cutting on Mother 5
    (14, '2023-03-11'),
    (14, '2023-03-11'),
    (14, '2023-03-11'),
    (14, '2023-03-11'),
    (14, '2023-03-11'),

    -- Transplants from Third cutting on Mother 5
    (15, '2023-03-24'),
    (15, '2023-03-24'),
    (15, '2023-03-24'),
    (15, '2023-03-24'),
    (15, '2023-03-24'),

    -- Transplants from First cutting on Mother 6
    (16, '2023-02-26'),
    (16, '2023-02-26'),
    (16, '2023-02-26'),
    (16, '2023-02-26'),
    (16, '2023-02-26'),

    -- Transplants from Second cutting on Mother 6
    (17, '2023-03-11'),
    (17, '2023-03-11'),
    (17, '2023-03-11'),
    (17, '2023-03-11'),
    (17, '2023-03-11'),

    -- Transplants from Third cutting on Mother 6
    (18, '2023-03-24'),
    (18, '2023-03-24'),
    (18, '2023-03-24'),
    (18, '2023-03-24'),
    (18, '2023-03-24'),

    -- Transplants from First cutting on Mother 7
    (19, '2023-02-26'),
    (19, '2023-02-26'),
    (19, '2023-02-26'),
    (19, '2023-02-26'),
    (19, '2023-02-26'),

    -- Transplants from Second cutting on Mother 7
    (20, '2023-03-11'),
    (20, '2023-03-11'),
    (20, '2023-03-11'),
    (20, '2023-03-11'),
    (20, '2023-03-11'),

    -- Transplants from Third cutting on Mother 7
    (21, '2023-03-24'),
    (21, '2023-03-24'),
    (21, '2023-03-24'),
    (21, '2023-03-24'),
    (21, '2023-03-24'),

    -- Transplants from First cutting on Mother 8
    (22, '2023-02-26'),
    (22, '2023-02-26'),
    (22, '2023-02-26'),
    (22, '2023-02-26'),
    (22, '2023-02-26'),

    -- Transplants from Second cutting on Mother 8
    (23, '2023-03-11'),
    (23, '2023-03-11'),
    (23, '2023-03-11'),
    (23, '2023-03-11'),
    (23, '2023-03-11'),

    -- Transplants from Third cutting on Mother 8
    (24, '2023-03-24'),
    (24, '2023-03-24'),
    (24, '2023-03-24'),
    (24, '2023-03-24'),
    (24, '2023-03-24'),

    -- Transplants from First cutting on Mother 9
    (25, '2023-02-26'),
    (25, '2023-02-26'),
    (25, '2023-02-26'),
    (25, '2023-02-26'),
    (25, '2023-02-26'),

    -- Transplants from Second cutting on Mother 9
    (26, '2023-03-11'),
    (26, '2023-03-11'),
    (26, '2023-03-11'),
    (26, '2023-03-11'),
    (26, '2023-03-11'),

    -- Transplants from Third cutting on Mother 9
    (27, '2023-03-24'),
    (27, '2023-03-24'),
    (27, '2023-03-24'),
    (27, '2023-03-24'),
    (27, '2023-03-24'),

    -- Transplants from First cutting on Mother 10
    (28, '2023-02-26'),
    (28, '2023-02-26'),
    (28, '2023-02-26'),
    (28, '2023-02-26'),
    (28, '2023-02-26'),

    -- Transplants from Second cutting on Mother 10
    (29, '2023-03-11'),
    (29, '2023-03-11'),
    (29, '2023-03-11'),
    (29, '2023-03-11'),
    (29, '2023-03-11'),

    -- Transplants from Third cutting on Mother 10
    (30, '2023-03-24'),
    (30, '2023-03-24'),
    (30, '2023-03-24'),
    (30, '2023-03-24'),
    (30, '2023-03-24'),

    -- Transplants from First cutting on Mother 11
    (31, '2023-02-26'),
    (31, '2023-02-26'),
    (31, '2023-02-26'),
    (31, '2023-02-26'),
    (31, '2023-02-26'),

    -- Transplants from Second cutting on Mother 11
    (32, '2023-03-11'),
    (32, '2023-03-11'),
    (32, '2023-03-11'),
    (32, '2023-03-11'),
    (32, '2023-03-11'),

    -- Transplants from Third cutting on Mother 11
    (33, '2023-03-24'),
    (33, '2023-03-24'),
    (33, '2023-03-24'),
    (33, '2023-03-24'),
    (33, '2023-03-24'),

    -- Transplants from First cutting on Mother 12
    (34, '2023-02-26'),
    (34, '2023-02-26'),
    (34, '2023-02-26'),
    (34, '2023-02-26'),
    (34, '2023-02-26'),

    -- Transplants from Second cutting on Mother 12
    (35, '2023-03-11'),
    (35, '2023-03-11'),
    (35, '2023-03-11'),
    (35, '2023-03-11'),
    (35, '2023-03-11'),

    -- Transplants from Third cutting on Mother 12
    (36, '2023-03-24'),
    (36, '2023-03-24'),
    (36, '2023-03-24'),
    (36, '2023-03-24'),
    (36, '2023-03-24'),

    -- Transplants from First cutting on Mother 13
    (37, '2023-02-26'),
    (37, '2023-02-26'),
    (37, '2023-02-26'),
    (37, '2023-02-26'),
    (37, '2023-02-26'),

    -- Transplants from Second cutting on Mother 13
    (38, '2023-03-11'),
    (38, '2023-03-11'),
    (38, '2023-03-11'),
    (38, '2023-03-11'),
    (38, '2023-03-11'),

    -- Transplants from Third cutting on Mother 13
    (39, '2023-03-24'),
    (39, '2023-03-24'),
    (39, '2023-03-24'),
    (39, '2023-03-24'),
    (39, '2023-03-24'),

    -- Transplants from First cutting on Mother 14
    (40, '2023-02-26'),
    (40, '2023-02-26'),
    (40, '2023-02-26'),
    (40, '2023-02-26'),
    (40, '2023-02-26'),

    -- Transplants from Second cutting on Mother 14
    (41, '2023-03-11'),
    (41, '2023-03-11'),
    (41, '2023-03-11'),
    (41, '2023-03-11'),
    (41, '2023-03-11'),

    -- Transplants from Third cutting on Mother 14
    (42, '2023-03-24'),
    (42, '2023-03-24'),
    (42, '2023-03-24'),
    (42, '2023-03-24'),
    (42, '2023-03-24'),

    -- Transplants from First cutting on Mother 15
    (43, '2023-02-26'),
    (43, '2023-02-26'),
    (43, '2023-02-26'),
    (43, '2023-02-26'),
    (43, '2023-02-26'),

    -- Transplants from Second cutting on Mother 15
    (44, '2023-03-11'),
    (44, '2023-03-11'),
    (44, '2023-03-11'),
    (44, '2023-03-11'),
    (44, '2023-03-11'),

    -- Transplants from Third cutting on Mother 15
    (45, '2023-03-24'),
    (45, '2023-03-24'),
    (45, '2023-03-24'),
    (45, '2023-03-24'),
    (45, '2023-03-24'),

    -- Transplants from First cutting on Mother 16
    (46, '2023-02-26'),
    (46, '2023-02-26'),
    (46, '2023-02-26'),
    (46, '2023-02-26'),
    (46, '2023-02-26'),

    -- Transplants from Second cutting on Mother 16
    (47, '2023-03-11'),
    (47, '2023-03-11'),
    (47, '2023-03-11'),
    (47, '2023-03-11'),
    (47, '2023-03-11'),

    -- Transplants from Third cutting on Mother 16
    (48, '2023-03-24'),
    (48, '2023-03-24'),
    (48, '2023-03-24'),
    (48, '2023-03-24'),
    (48, '2023-03-24'),

    -- Transplants from First cutting on Mother 17
    (49, '2023-02-26'),
    (49, '2023-02-26'),
    (49, '2023-02-26'),
    (49, '2023-02-26'),
    (49, '2023-02-26'),

    -- Transplants from Second cutting on Mother 17
    (50, '2023-03-11'),
    (50, '2023-03-11'),
    (50, '2023-03-11'),
    (50, '2023-03-11'),
    (50, '2023-03-11'),

    -- Transplants from Third cutting on Mother 17
    (51, '2023-03-24'),
    (51, '2023-03-24'),
    (51, '2023-03-24'),
    (51, '2023-03-24'),
    (51, '2023-03-24'),

    -- Transplants from First cutting on Mother 18
    (52, '2023-02-26'),
    (52, '2023-02-26'),
    (52, '2023-02-26'),
    (52, '2023-02-26'),
    (52, '2023-02-26'),

    -- Transplants from Second cutting on Mother 18
    (53, '2023-03-11'),
    (53, '2023-03-11'),
    (53, '2023-03-11'),
    (53, '2023-03-11'),
    (53, '2023-03-11'),

    -- Transplants from Third cutting on Mother 18
    (54, '2023-03-24'),
    (54, '2023-03-24'),
    (54, '2023-03-24'),
    (54, '2023-03-24'),
    (54, '2023-03-24'),

    -- Transplants from First cutting on Mother 19
    (55, '2023-02-26'),
    (55, '2023-02-26'),
    (55, '2023-02-26'),
    (55, '2023-02-26'),
    (55, '2023-02-26'),

    -- Transplants from Second cutting on Mother 19
    (56, '2023-03-11'),
    (56, '2023-03-11'),
    (56, '2023-03-11'),
    (56, '2023-03-11'),
    (56, '2023-03-11'),

    -- Transplants from Third cutting on Mother 19
    (57, '2023-03-24'),
    (57, '2023-03-24'),
    (57, '2023-03-24'),
    (57, '2023-03-24'),
    (57, '2023-03-24'),

    -- Transplants from First cutting on Mother 20
    (58, '2023-02-26'),
    (58, '2023-02-26'),
    (58, '2023-02-26'),
    (58, '2023-02-26'),
    (58, '2023-02-26'),s

    -- Transplants from Second cutting on Mother 20
    (59, '2023-03-11'),
    (59, '2023-03-11'),
    (59, '2023-03-11'),
    (59, '2023-03-11'),
    (59, '2023-03-11'),

    -- Transplants from Third cutting on Mother 20
    (60, '2023-03-24'),
    (60, '2023-03-24'),
    (60, '2023-03-24'),
    (60, '2023-03-24'),
    (60, '2023-03-24'),

    -- Transplants from First cutting on Mother 21
    (61, '2023-02-26'),
    (61, '2023-02-26'),
    (61, '2023-02-26'),
    (61, '2023-02-26'),
    (61, '2023-02-26'),

    -- Transplants from Second cutting on Mother 21
    (62, '2023-03-11'),
    (62, '2023-03-11'),
    (62, '2023-03-11'),
    (62, '2023-03-11'),
    (62, '2023-03-11'),

    -- Transplants from Third cutting on Mother 21
    (63, '2023-03-24'),
    (63, '2023-03-24'),
    (63, '2023-03-24'),
    (63, '2023-03-24'),
    (63, '2023-03-24'),

    -- Transplants from First cutting on Mother 22
    (64, '2023-02-26'),
    (64, '2023-02-26'),
    (64, '2023-02-26'),
    (64, '2023-02-26'),
    (64, '2023-02-26'),

    -- Transplants from Second cutting on Mother 22
    (65, '2023-03-11'),
    (65, '2023-03-11'),
    (65, '2023-03-11'),
    (65, '2023-03-11'),
    (65, '2023-03-11'),

    -- Transplants from Third cutting on Mother 22
    (66, '2023-03-24'),
    (66, '2023-03-24'),
    (66, '2023-03-24'),
    (66, '2023-03-24'),
    (66, '2023-03-24'),

    -- Transplants from First cutting on Mother 23
    (67, '2023-02-26'),
    (67, '2023-02-26'),
    (67, '2023-02-26'),
    (67, '2023-02-26'),
    (67, '2023-02-26'),

    -- Transplants from Second cutting on Mother 23
    (68, '2023-03-11'),
    (68, '2023-03-11'),
    (68, '2023-03-11'),
    (68, '2023-03-11'),
    (68, '2023-03-11'),

    -- Transplants from Third cutting on Mother 23
    (69, '2023-03-24'),
    (69, '2023-03-24'),
    (69, '2023-03-24'),
    (69, '2023-03-24'),
    (69, '2023-03-24'),

    -- Transplants from First cutting on Mother 24
    (70, '2023-02-26'),
    (70, '2023-02-26'),
    (70, '2023-02-26'),
    (70, '2023-02-26'),
    (70, '2023-02-26'),

    -- Transplants from Second cutting on Mother 24
    (71, '2023-03-11'),
    (71, '2023-03-11'),
    (71, '2023-03-11'),
    (71, '2023-03-11'),
    (71, '2023-03-11'),

    -- Transplants from Third cutting on Mother 24
    (72, '2023-03-24'),
    (72, '2023-03-24'),
    (72, '2023-03-24'),
    (72, '2023-03-24'),
    (72, '2023-03-24'),

    -- Transplants from First cutting on Mother 25
    (73, '2023-02-26'),
    (73, '2023-02-26'),
    (73, '2023-02-26'),
    (73, '2023-02-26'),
    (73, '2023-02-26'),

    -- Transplants from Second cutting on Mother 25
    (74, '2023-03-11'),
    (74, '2023-03-11'),
    (74, '2023-03-11'),
    (74, '2023-03-11'),
    (74, '2023-03-11'),

    -- Transplants from Third cutting on Mother 25
    (75, '2023-03-24'),
    (75, '2023-03-24'),
    (75, '2023-03-24'),
    (75, '2023-03-24'),
    (75, '2023-03-24'),

    -- Transplants from First cutting on Mother 26
    (76, '2023-02-26'),
    (76, '2023-02-26'),
    (76, '2023-02-26'),
    (76, '2023-02-26'),
    (76, '2023-02-26'),

    -- Transplants from Second cutting on Mother 26
    (77, '2023-03-11'),
    (77, '2023-03-11'),
    (77, '2023-03-11'),
    (77, '2023-03-11'),
    (77, '2023-03-11'),

    -- Transplants from Third cutting on Mother 26
    (78, '2023-03-24'),
    (78, '2023-03-24'),
    (78, '2023-03-24'),
    (78, '2023-03-24'),
    (78, '2023-03-24'),

    -- Transplants from First cutting on Mother 27
    (79, '2023-02-26'),
    (79, '2023-02-26'),
    (79, '2023-02-26'),
    (79, '2023-02-26'),
    (79, '2023-02-26'),

    -- Transplants from Second cutting on Mother 27
    (80, '2023-03-11'),
    (80, '2023-03-11'),
    (80, '2023-03-11'),
    (80, '2023-03-11'),
    (80, '2023-03-11'),

    -- Transplants from Third cutting on Mother 27
    (81, '2023-03-24'),
    (81, '2023-03-24'),
    (81, '2023-03-24'),
    (81, '2023-03-24'),
    (81, '2023-03-24');

-- Insert data into Daughter Table
--DateHarvested + 7 days
INSERT INTO Daughter (TransplantID, Price, DateDaughtered, HealthStatus, Fate)
VALUES
    -- Daughters from First cutting on Mother 1
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 1
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 1
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

    -- Daughters from First cutting on Mother 2
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 2
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 2
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 3
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 3
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 3
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 4
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 4
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 4
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 5
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 5
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 5
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 6
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 6
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 6
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 7
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 7
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 7
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 8
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 8
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 8
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 9
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 9
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 9
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 10
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 10
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 10
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 11
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 11
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 11
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 12
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 12
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 12
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 13
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 13
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 13
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 14
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 14
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 14
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 15
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 15
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 15
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 16
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 16
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 16
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 17
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 17
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 17
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 18
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 18
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 18
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 19
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 19
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 19
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 20
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 20
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 20
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 21
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 21
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 21
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 22
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 22
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 22
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 23
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 23
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 23
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 24
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 24
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 24
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 25
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 25
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 25
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 26
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 26
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 26
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated'),

        -- Daughters from First cutting on Mother 27
    (1, 100, '2023-03-07', 1, 'Kept'),
    (2, 100, '2023-03-07', 1, 'Sold'),
    (3, 100, '2023-03-07', 0, 'Destroyed'),
    (4, 100, '2023-03-07', 1, 'Donated'),

    -- Daughters from Second cutting on Mother 27
    (5, 100, '2023-03-28', 1, 'Kept'),
    (6, 100, '2023-03-28', 1, 'Sold'),
    (7, 100, '2023-03-28', 0, 'Destroyed'),
    (8, 100, '2023-03-28', 1, 'Donated'),

    -- Daughters from Third cutting on Mother 27
    (9, 100, '2023-04-18', 1, 'Kept'),
    (10, 100, '2023-04-18', 1, 'Sold'),
    (11, 100, '2023-04-18', 0, 'Destroyed'),
    (12, 100, '2023-04-18', 1, 'Donated');

-- Create constraints, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constraints and indexes for the remaining tables in your schema.
