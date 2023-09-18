-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    VendorName VARCHAR(150) UNIQUE NOT NULL
);

-- Create the Strain Table
CREATE TABLE Strain (
    StrainID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    NickName VARCHAR(150),
    FirstName VARCHAR(150),
    MiddleName VARCHAR(150),
    LastName VARCHAR(150),
    BreederVendorID INT NOT NULL,
    GeneticMarkerID INT NOT NULL,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the StrainSeedBag Table
CREATE TABLE StrainSeedBag (
    StrainSeedBagID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    StrainID INT NOT NULL,
    BreederVendorID INT NOT NULL,
    StrainSeedBagName VARCHAR(150),
    PackageUnits INT,
    DateReceived DATE DEFAULT GETDATE(),
    ExpirationDate AS DATEADD(YEAR, 2, DateReceived), -- Calculate ExpirationDate
    FOREIGN KEY (StrainID) REFERENCES Strain(StrainID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Genus VARCHAR(100) NOT NULL,  -- Added NOT NULL constraint
    Species VARCHAR(100) UNIQUE NOT NULL
);

-- Create the Phenotypic Marker Table
CREATE TABLE PhenotypicMarker (
    PhenotypicMarkerID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MarkerName VARCHAR(100) UNIQUE NOT NULL,
    GeneticMarkerID INT NOT NULL,
    NumberOfBranches INT,
    Height INT,
    LeafColour VARCHAR(100),  -- Adjusted length based on your data
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    StrainSeedBagID INT NOT NULL,
    BreederVendorID INT NOT NULL,
    GeneticMarkerID INT NOT NULL,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StrainSeedBagID) REFERENCES StrainSeedBag(StrainSeedBagID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedID INT NOT NULL,  -- Removed UNIQUE constraint
    StrainSeedBagID INT NOT NULL,
    DatePlanted DATE,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StrainSeedBagID) REFERENCES StrainSeedBag(StrainSeedBagID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedID INT NOT NULL,  -- Removed UNIQUE constraint
    SeedingID INT NOT NULL,
    SproutDate DATE,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedingID) REFERENCES Seeding(SeedingID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedlingID INT,
    DateMothered DATE,
    NumberOfBranches INT,
    LeafColour VARCHAR(150),
    PhenotypicMarkerID INT NOT NULL,
    GeneticMarkerID INT NOT NULL,
    StrainID INT NOT NULL, -- Added NOT NULL constraint
    FOREIGN KEY (SeedlingID) REFERENCES Seedling(SeedlingID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StrainID) REFERENCES Strain(StrainID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Maturity Table
CREATE TABLE Maturity (
    MaturityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MotherID INT NOT NULL,
    DateOfMaturityCheck DATE,
    Height INT,
    NumberOfBranches INT,
    LeafColour VARCHAR(150),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MotherID INT NOT NULL,
    NumberOfCuts SMALLINT,
    CutDate DATE,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CutID INT NOT NULL,
    TransplantDate DATE,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MotherID INT NOT NULL,
    Price SMALLINT,
    Packaged BOOLEAN,
    TransplantID INT UNIQUE NOT NULL,
    GeneticMarkerID INT NOT NULL,
    PhenotypicMarkerID INT NOT NULL,
    DateDaughtered DATE,
    Age INT, -- Calculate this based on CutDate and TransplantDate
    LeafColour VARCHAR(150),
    HealthStatus BOOLEAN,
    Fate VARCHAR(50), -- To track fate (e.g., 'Kept', 'Sold', 'Destroyed', 'Donated')
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Indexes for SeedBreederVendor Table
CREATE INDEX idx_SeedBreederVendor_BreederVendorID ON SeedBreederVendor (BreederVendorID);
CREATE UNIQUE INDEX UI_SeedBreederVendor_VendorName ON SeedBreederVendor (VendorName);

-- Indexes for Strain Table
CREATE INDEX idx_Strain_StrainID ON Strain (StrainID);
CREATE INDEX idx_Strain_BreederVendorID ON Strain (BreederVendorID);

-- Indexes for StrainSeedBag Table
CREATE INDEX idx_StrainSeedBag_StrainID ON StrainSeedBag (StrainID);
CREATE INDEX idx_StrainSeedBag_BreederVendorID ON StrainSeedBag (BreederVendorID);
CREATE INDEX idx_StrainSeedBag_StrainSeedBagName ON StrainSeedBag (StrainSeedBagName);
CREATE INDEX idx_StrainSeedBag_ExpirationDate ON StrainSeedBag (ExpirationDate);

-- Indexes for GeneticMarker Table
CREATE INDEX idx_GeneticMarker_GeneticMarkerID ON GeneticMarker (GeneticMarkerID);
CREATE UNIQUE INDEX UI_GeneticMarker_Species ON GeneticMarker (Species);

-- Indexes for PhenotypicMarker Table
CREATE INDEX idx_PhenotypicMarker_PhenotypicMarkerID ON PhenotypicMarker (PhenotypicMarkerID);
CREATE UNIQUE INDEX UI_PhenotypicMarker_MarkerName ON PhenotypicMarker (MarkerName);
CREATE INDEX idx_PhenotypicMarker_GeneticMarkerID ON PhenotypicMarker (GeneticMarkerID);

-- Indexes for Seed Table
CREATE INDEX idx_Seed_StrainSeedBagID ON Seed (StrainSeedBagID);
CREATE INDEX idx_Seed_BreederVendorID ON Seed (BreederVendorID);
CREATE INDEX idx_Seed_GeneticMarkerID ON Seed (GeneticMarkerID);
CREATE INDEX idx_Seed_PhenotypicMarkerID ON Seed (PhenotypicMarkerID);

-- Indexes for Seeding Table
CREATE INDEX idx_Seeding_SeedID ON Seeding (SeedID);
CREATE INDEX idx_Seeding_StrainSeedBagID ON Seeding (StrainSeedBagID);
CREATE INDEX idx_Seeding_DatePlanted ON Seeding (DatePlanted);

-- Indexes for Seedling Table
CREATE INDEX idx_Seedling_SeedID ON Seedling (SeedID);
CREATE INDEX idx_Seedling_SeedingID ON Seedling (SeedingID);
CREATE INDEX idx_Seedling_SproutDate ON Seedling (SproutDate);

-- Indexes for Mothers Table
CREATE INDEX idx_Mothers_SeedlingID ON Mothers (SeedlingID);
CREATE INDEX idx_Mothers_PhenotypicMarkerID ON Mothers (PhenotypicMarkerID);
CREATE INDEX idx_Mothers_GeneticMarkerID ON Mothers (GeneticMarkerID);
CREATE INDEX idx_Mothers_StrainID ON Mothers (StrainID);

-- Indexes for Maturity Table
CREATE INDEX idx_Maturity_MotherID ON Maturity (MotherID);

-- Indexes for Cutting Table
CREATE INDEX idx_Cutting_MotherID ON Cutting (MotherID);

-- Indexes for Transplant Table
CREATE INDEX idx_Transplant_CutID ON Transplant (CutID);

-- Indexes for Daughter Table
CREATE INDEX idx_Daughter_MotherID ON Daughter (MotherID);
CREATE INDEX idx_Daughter_GeneticMarkerID ON Daughter (GeneticMarkerID);
CREATE INDEX idx_Daughter_PhenotypicMarkerID ON Daughter (PhenotypicMarkerID);
CREATE INDEX idx_Daughter_TransplantID ON Daughter (TransplantID);

-- Insert data into SeedBreederVendor Table
INSERT INTO SeedBreederVendor (VendorName)
VALUES
    ('MarijuanaSouthAfrica'),
    ('GrowWeedAfrica'),
    ('BagSeeds'),
    ('Vendor1');

-- Insert data into GeneticMarker Table
INSERT INTO GeneticMarker (Genus, Species)
VALUES
    ('Cannabis', 'Sativa'),
    ('Cannabis', 'Indica'),
    ('Cannabis', 'Hybrid');

INSERT INTO PhenotypicMarker (MarkerName, GeneticMarkerID, NumberOfBranches, Height, LeafColour)
VALUES
    -- Cannabis Sativa specific PhenotypicMarkers
    ('Seedling Stage (Sativa)', 1, 2, 5, 'Green (Light)'),
    ('Early Vegetative Stage (Sativa)', 1, 6, 20, 'Green (Medium)'),
    ('Late Vegetative Stage (Sativa)', 1, 12, 40, 'Green (Dark)'),
    ('Pre-Flowering Stage (Sativa)', 1, 18, 70, 'Green (Dark)'),
    ('Early Flowering Stage (Sativa)', 1, 24, 100, 'Varied (Light to Dark)'),
    ('Mid-Flowering Stage (Sativa)', 1, 30, 150, 'Varied (Light to Dark)'),
    ('Late Flowering Stage (Sativa)', 1, 36, 200, 'Varied (Light to Dark)'),
    ('Mid-Maturity Stage (Sativa)', 1, 42, 220, 'Autumn Colors'),
    ('Mid-Harvest Stage (Sativa)', 1, 48, 240, 'Drying and Curing'),
    ('Post-Harvest Stage (Sativa)', 1, 50, 254, 'Drying and Curing'),
        -- Cannabis Indica specific PhenotypicMarkers
    ('Seedling Stage (Indica)', 2, 2, 5, 'Green (Light)', ),
    ('Early Vegetative Stage (Indica)', 2, 6, 20, 'Green (Medium)'),
    ('Late Vegetative Stage (Indica)', 2, 12, 40, 'Green (Dark)'),
    ('Pre-Flowering Stage (Indica)', 2, 18, 70, 'Green (Dark)'),
    ('Early Flowering Stage (Indica)', 2, 24, 100, 'Varied (Light to Dark)'),
    ('Mid-Flowering Stage (Indica)', 2, 30, 150, 'Varied (Light to Dark)'),
    ('Late Flowering Stage (Indica)', 2, 36, 200, 'Varied (Light to Dark)'),
    ('Mid-Maturity Stage (Indica)', 2, 42, 220, 'Autumn Colors'),
    ('Mid-Harvest Stage (Indica)', 2, 48, 240, 'Drying and Curing'),
    ('Post-Harvest Stage (Indica)', 2, 50, 254, 'Drying and Curing'),
        -- Cannabis Hybrid specific PhenotypicMarkers
    ('Seedling Stage (Hybrid)', 3, 2, 5, 'Green (Light)', ),
    ('Early Vegetative Stage (Hybrid)', 3, 6, 20, 'Green (Medium)'),
    ('Late Vegetative Stage (Hybrid)', 3, 12, 40, 'Green (Dark)'),
    ('Pre-Flowering Stage (Hybrid)', 3, 18, 70, 'Green (Dark)'),
    ('Early Flowering Stage (Hybrid)', 3, 24, 100, 'Varied (Light to Dark)'),
    ('Mid-Flowering Stage (Hybrid)', 3, 30, 150, 'Varied (Light to Dark)'),
    ('Late Flowering Stage (Hybrid)', 3, 36, 200, 'Varied (Light to Dark)'),
    ('Mid-Maturity Stage (Hybrid)', 3, 42, 220, 'Autumn Colors'),
    ('Mid-Harvest Stage (Hybrid)', 3, 48, 240, 'Drying and Curing'),
    ('Post-Harvest Stage (Hybrid)', 3, 50, 254, 'Drying and Curing', 'May Change');

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
INSERT INTO StrainSeedBag (StrainID, BreederVendorID, StrainSeedBagName, PackageUnits, DateReceived)
VALUES
    (1, 1, 'BagSeeds1', 3, '2023-01-11'), --BagSeeds1 is a Sativa from MarijuanaSouthAfrica
    (4, 1, 'BagSeeds2', 3, '2023-01-11'), --BagSeeds2 is a Indica from MarijuanaSouthAfrica
    (7, 1, 'BagSeeds3', 3, '2023-01-11'), --BagSeeds3 is a Hybird from MarijuanaSouthAfrica
    (2, 2, 'SeedPack1', 3, '2023-01-11'), --SeedPack1 is a Sativa from GrowWeedAfrica
    (5, 2, 'SeedPack2', 3, '2023-01-11'), --SeedPack2 is a Indica from GrowWeedAfrica
    (8, 2, 'SeedPack3', 3, '2023-01-11'), --SeedPack3 is a Hybird from GrowWeedAfrica
    (3, 3, 'SeedPack4', 3, '2023-02-15'), --SeedPack4 is a Sativa from BagSeeds
    (6, 3, 'SeedPack5', 3, '2023-02-15'), --SeedPack5 is a Indica from BagSeeds
    (9, 3, 'SeedPack6', 3, '2023-03-20'); --SeedPack6 is a Hybrid from BagSeeds

INSERT INTO Seed (StrainSeedBagID, BreederVendorID, GeneticMarkerID) -- 27 seeds
VALUES
    -- For StrainSeedBag 1 (BagSeeds1) has 3 entries for each seed in a bag
    (1, 1, 1),   -- Seed 1
    (1, 1, 1),   -- Seed 2
    (1, 1, 1),   -- Seed 3
    -- For StrainSeedBag 2 (BagSeeds2) has 3 entries for each seed in a bag
    (2, 1, 1),   -- Seed 4
    (2, 1, 1),   -- Seed 5
    (2, 1, 1),   -- Seed 6
    -- For StrainSeedBag 3 (BagSeeds3) has 3 entries for each seed in a bag
    (3, 1, 1),   -- Seed 7
    (3, 1, 1),   -- Seed 8
    (3, 1, 1),   -- Seed 9
    -- For StrainSeedBag 4 (SeedPack1) has 3 entries for each seed in a bag
    (4, 2, 1),   -- Seed 10
    (4, 2, 1),   -- Seed 11
    (4, 2, 1),   -- Seed 12
    -- For StrainSeedBag 5 (SeedPack2) has 3 entries for each seed in a bag
    (5, 2, 2),   -- Seed 13
    (5, 2, 2),   -- Seed 14
    (5, 2, 2),   -- Seed 15
    -- For StrainSeedBag 6 (SeedPack3) has 3 entries for each seed in a bag
    (6, 2, 3),   -- Seed 16
    (6, 2, 3),   -- Seed 17
    (6, 2, 3),   -- Seed 18
    -- For StrainSeedBag 7 (SeedPack4) has 3 entries for each seed in a bag
    (7, 3, 1),   -- Seed 19
    (7, 3, 1),   -- Seed 20
    (7, 3, 1),   -- Seed 21
    -- For StrainSeedBag 8 (SeedPack5) has 3 entries for each seed in a bag
    (8, 3, 2),   -- Seed 22
    (8, 3, 2),   -- Seed 23
    (8, 3, 2),   -- Seed 24
    -- For StrainSeedBag 9 (SeedPack6) has 3 entries for each seed in a bag
    (9, 3, 3),   -- Seed 25
    (9, 3, 3),   -- Seed 26
    (9, 3, 3);   -- Seed 27

-- Insert data into Seeding Table
INSERT INTO Seeding (SeedID, StrainSeedBagID, DatePlanted) -- 27 Seeding -- DatePlanted 2023-01-01
VALUES
    -- For Seed 1 (in StrainSeedBag 1)
    (1, 1, '2023-01-01'),
    -- For Seed 2 (in StrainSeedBag 1)
    (2, 1, '2023-01-01'),
    -- For Seed 3 (in StrainSeedBag 1)
    (3, 1, '2023-01-01'),
    -- For Seed 4 (in StrainSeedBag 2)
    (4, 2, '2023-01-01'),
    -- For Seed 5 (in StrainSeedBag 2)
    (5, 2, '2023-01-01'),
    -- For Seed 6 (in StrainSeedBag 2)
    (6, 2, '2023-01-01'),
    -- For Seed 7 (in StrainSeedBag 3)
    (7, 3, '2023-01-01'),
    -- For Seed 8 (in StrainSeedBag 3)
    (8, 3, '2023-01-01'),
    -- For Seed 9 (in StrainSeedBag 3)
    (9, 3, '2023-01-01'),
    -- For Seed 10 (in StrainSeedBag 4)
    (10, 4, '2023-01-01'),
    -- For Seed 11 (in StrainSeedBag 4)
    (11, 4, '2023-01-01'),
    -- For Seed 12 (in StrainSeedBag 4)
    (12, 4, '2023-01-01'),
    -- For Seed 13 (in StrainSeedBag 5)
    (13, 5, '2023-01-01'),
    -- For Seed 14 (in StrainSeedBag 5)
    (14, 5, '2023-01-01'),
    -- For Seed 15 (in StrainSeedBag 5)
    (15, 5, '2023-01-01'),
    -- For Seed 16 (in StrainSeedBag 6)
    (16, 6, '2023-01-01'),
    -- For Seed 17 (in StrainSeedBag 6)
    (17, 6, '2023-01-01'),
    -- For Seed 18 (in StrainSeedBag 6)
    (18, 6, '2023-01-01'),
    -- For Seed 19 (in StrainSeedBag 7)
    (19, 7, '2023-01-01'),
    -- For Seed 20 (in StrainSeedBag 7)
    (20, 7, '2023-01-01'),
    -- For Seed 21 (in StrainSeedBag 7)
    (21, 7, '2023-01-01'),
    -- For Seed 22 (in StrainSeedBag 8)
    (22, 8, '2023-01-01'),
    -- For Seed 23 (in StrainSeedBag 8)
    (23, 8, '2023-01-01'),
    -- For Seed 24 (in StrainSeedBag 8)
    (24, 8, '2023-01-01'),
    -- For Seed 25 (in StrainSeedBag 9)
    (25, 9, '2023-01-01'),
    -- For Seed 26 (in StrainSeedBag 9)
    (26, 9, '2023-01-01'),
    -- For Seed 27 (in StrainSeedBag 9)
    (27, 9, '2023-01-01');

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SeedingID, SproutDate, Age) -- 27 Seedlings -- DatePlanted 2023-01-01 + 7 days = SproutDate (2023-01-07)
VALUES
    (1, 1, '2023-01-07', 7),   -- Seedling 1
    (2, 2, '2023-01-07', 7),   -- Seedling 2
    (3, 3, '2023-01-07', 7),   -- Seedling 3
    (4, 4, '2023-01-07', 7),   -- Seedling 4
    (5, 5, '2023-01-07', 7),   -- Seedling 5
    (6, 6, '2023-01-07', 7),   -- Seedling 6
    (7, 7, '2023-01-07', 7),   -- Seedling 7
    (8, 8, '2023-01-07', 7),   -- Seedling 8
    (9, 9, '2023-01-07', 7),   -- Seedling 9
    (10, 10, '2023-01-07', 7), -- Seedling 10
    (11, 11, '2023-01-07', 7), -- Seedling 11
    (12, 12, '2023-01-07', 7), -- Seedling 12
    (13, 13, '2023-01-07', 7), -- Seedling 13
    (14, 14, '2023-01-07', 7), -- Seedling 14
    (15, 15, '2023-01-07', 7), -- Seedling 15
    (16, 16, '2023-01-07', 7), -- Seedling 16
    (17, 17, '2023-01-07', 7), -- Seedling 17
    (18, 18, '2023-01-07', 7), -- Seedling 18
    (19, 19, '2023-01-07', 7), -- Seedling 19
    (20, 20, '2023-01-07', 7), -- Seedling 20
    (21, 21, '2023-01-07', 7), -- Seedling 21
    (22, 22, '2023-01-07', 7), -- Seedling 22
    (23, 23, '2023-01-07', 7), -- Seedling 23
    (24, 24, '2023-01-07', 7), -- Seedling 24
    (25, 25, '2023-01-07', 7), -- Seedling 25
    (26, 26, '2023-01-07', 7), -- Seedling 26
    (27, 27, '2023-01-07', 7); -- Seedling 27

-- Insert data into Mothers Table 
-- 27 mothers 
-- SproutDate + 60 days = DateMothered (2023-02-07)
-- NumberOfBranches = 666
INSERT INTO Mothers (SeedlingID, DateMothered, NumberOfBranches, LeafColour, PhenotypicMarkerID, GeneticMarkerID, StrainID)
VALUES
    (1, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1),   -- Mother 1
    (2, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1),   -- Mother 2
    (3, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1),   -- Mother 3
    (4, '2023-02-07', 11, 'Green (Dark)', 13, 4, 2),   -- Mother 4
    (5, '2023-02-07', 11, 'Green (Dark)', 13, 5, 2),   -- Mother 5
    (6, '2023-02-07', 11, 'Green (Dark)', 13, 6, 2),   -- Mother 6
    (7, '2023-02-07', 11, 'Green (Dark)', 23, 7, 3),   -- Mother 7
    (8, '2023-02-07', 11, 'Green (Dark)', 23, 8, 3),   -- Mother 8
    (9, '2023-02-07', 11, 'Green (Dark)', 23, 9, 3),   -- Mother 9
    (10, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1), -- Mother 10
    (11, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1), -- Mother 11
    (12, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1), -- Mother 12
    (13, '2023-02-07', 11, 'Green (Dark)', 13, 2, 2), -- Mother 13
    (14, '2023-02-07', 11, 'Green (Dark)', 13, 2, 2), -- Mother 14
    (15, '2023-02-07', 11, 'Green (Dark)', 13, 2, 2), -- Mother 15
    (16, '2023-02-07', 11, 'Green (Dark)', 23, 3, 3), -- Mother 16
    (17, '2023-02-07', 11, 'Green (Dark)', 23, 3, 3), -- Mother 17
    (18, '2023-02-07', 11, 'Green (Dark)', 23, 3, 3), -- Mother 18
    (19, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1), -- Mother 19
    (20, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1), -- Mother 20
    (21, '2023-02-07', 11, 'Green (Dark)', 3, 1, 1), -- Mother 21
    (22, '2023-02-07', 11, 'Green (Dark)', 13, 2, 2), -- Mother 22
    (23, '2023-02-07', 11, 'Green (Dark)', 13, 2, 2), -- Mother 23
    (24, '2023-02-07', 11, 'Green (Dark)', 13, 2, 2), -- Mother 24
    (25, '2023-02-07', 11, 'Green (Dark)', 23, 3, 3), -- Mother 25
    (26, '2023-02-07', 11, 'Green (Dark)', 23, 3, 3), -- Mother 26
    (27, '2023-02-07', 11, 'Green (Dark)', 23, 3, 3); -- Mother 27

-- Insert data into Maturity Table
-- there are 27 mothers
-- (2023-02-10) = DateOfMaturityCheck because each initial maturity check must happen within 3 days of being a mother for cutting.
-- every maturity check after must happen 3 weeks from that date
-- each mother will get 4 maturity checks each spaced out by 3 weeks (108 entries in total)
-- Height = 70
-- NumberOfBranches = 18
-- LeafColour = Green (Dark)
INSERT INTO Maturity (MotherID, DateOfMaturityCheck, Height, NumberOfBranches, LeafColour) 
VALUES
    -- Mother 1 Maturity Checks
    (1, '2023-02-10', 70, 18, 'Green (Dark)'),
    (1, '2023-03-03', 70, 18, 'Green (Dark)'),
    (1, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 2 Maturity Checks
    (2, '2023-02-10', 70, 18, 'Green (Dark)'),
    (2, '2023-03-03', 70, 18, 'Green (Dark)'),
    (2, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 3 Maturity Checks
    (3, '2023-02-10', 70, 18, 'Green (Dark)'),
    (3, '2023-03-03', 70, 18, 'Green (Dark)'),
    (3, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 4 Maturity Checks
    (4, '2023-02-10', 70, 18, 'Green (Dark)'),
    (4, '2023-03-03', 70, 18, 'Green (Dark)'),
    (4, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 5 Maturity Checks
    (5, '2023-02-10', 70, 18, 'Green (Dark)'),
    (5, '2023-03-03', 70, 18, 'Green (Dark)'),
    (5, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 6 Maturity Checks
    (6, '2023-02-10', 70, 18, 'Green (Dark)'),
    (6, '2023-03-03', 70, 18, 'Green (Dark)'),
    (6, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 7 Maturity Checks
    (7, '2023-02-10', 70, 18, 'Green (Dark)'),
    (7, '2023-03-03', 70, 18, 'Green (Dark)'),
    (7, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 8 Maturity Checks
    (8, '2023-02-10', 70, 18, 'Green (Dark)'),
    (8, '2023-03-03', 70, 18, 'Green (Dark)'),
    (8, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 9 Maturity Checks
    (9, '2023-02-10', 70, 18, 'Green (Dark)'),
    (9, '2023-03-03', 70, 18, 'Green (Dark)'),
    (9, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 10 Maturity Checks
    (10, '2023-02-10', 70, 18, 'Green (Dark)'),
    (10, '2023-03-03', 70, 18, 'Green (Dark)'),
    (10, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 11 Maturity Checks
    (11, '2023-02-10', 70, 18, 'Green (Dark)'),
    (11, '2023-03-03', 70, 18, 'Green (Dark)'),
    (11, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 12 Maturity Checks
    (12, '2023-02-10', 70, 18, 'Green (Dark)'),
    (12, '2023-03-03', 70, 18, 'Green (Dark)'),
    (12, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 13 Maturity Checks
    (13, '2023-02-10', 70, 18, 'Green (Dark)'),
    (13, '2023-03-03', 70, 18, 'Green (Dark)'),
    (13, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 14 Maturity Checks
    (14, '2023-02-10', 70, 18, 'Green (Dark)'),
    (14, '2023-03-03', 70, 18, 'Green (Dark)'),
    (14, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 15 Maturity Checks
    (15, '2023-02-10', 70, 18, 'Green (Dark)'),
    (15, '2023-03-03', 70, 18, 'Green (Dark)'),
    (15, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 16 Maturity Checks
    (16, '2023-02-10', 70, 18, 'Green (Dark)'),
    (16, '2023-03-03', 70, 18, 'Green (Dark)'),
    (16, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 17 Maturity Checks
    (17, '2023-02-10', 70, 18, 'Green (Dark)'),
    (17, '2023-03-03', 70, 18, 'Green (Dark)'),
    (17, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 18 Maturity Checks
    (18, '2023-02-10', 70, 18, 'Green (Dark)'),
    (18, '2023-03-03', 70, 18, 'Green (Dark)'),
    (18, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 19 Maturity Checks
    (19, '2023-02-10', 70, 18, 'Green (Dark)'),
    (19, '2023-03-03', 70, 18, 'Green (Dark)'),
    (19, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 20 Maturity Checks
    (20, '2023-02-10', 70, 18, 'Green (Dark)'),
    (20, '2023-03-03', 70, 18, 'Green (Dark)'),
    (20, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 21 Maturity Checks
    (21, '2023-02-10', 70, 18, 'Green (Dark)'),
    (21, '2023-03-03', 70, 18, 'Green (Dark)'),
    (21, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 22 Maturity Checks
    (22, '2023-02-10', 70, 18, 'Green (Dark)'),
    (22, '2023-03-03', 70, 18, 'Green (Dark)'),
    (22, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 23 Maturity Checks
    (23, '2023-02-10', 70, 18, 'Green (Dark)'),
    (23, '2023-03-03', 70, 18, 'Green (Dark)'),
    (23, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 24 Maturity Checks
    (24, '2023-02-10', 70, 18, 'Green (Dark)'),
    (24, '2023-03-03', 70, 18, 'Green (Dark)'),
    (24, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 25 Maturity Checks
    (25, '2023-02-10', 70, 18, 'Green (Dark)'),
    (25, '2023-03-03', 70, 18, 'Green (Dark)'),
    (25, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 26 Maturity Checks
    (26, '2023-02-10', 70, 18, 'Green (Dark)'),
    (26, '2023-03-03', 70, 18, 'Green (Dark)'),
    (26, '2023-03-24', 70, 18, 'Green (Dark)'),

    -- Mother 27 Maturity Checks
    (27, '2023-02-10', 70, 18, 'Green (Dark)'),
    (27, '2023-03-03', 70, 18, 'Green (Dark)'),
    (27, '2023-03-24', 70, 18, 'Green (Dark)');

-- Insert data into Cutting Table
INSERT INTO Cutting (MotherID, NumberOfCuts, CutDate) 
    -- Mother 1 cutting entries
    (1, 16, '2023-02-10'),
    (1, 16, '2023-03-03'),
    (1, 16, '2023-03-24'),

    -- Mother 2 cutting entries
    (2, 16, '2023-02-10'),
    (2, 16, '2023-03-03'),
    (2, 16, '2023-03-24'),

   -- Mother 3 cutting entries
    (3, 16, '2023-02-10'),
    (3, 16, '2023-03-03'),
    (3, 16, '2023-03-24'),

    -- Mother 4 cutting entries
    (4, 16, '2023-02-10'),
    (4, 16, '2023-03-03'),
    (4, 16, '2023-03-24'),

    -- Mother 27 cutting entries
    (27, 16, '2023-02-10'),
    (27, 16, '2023-03-03'),
    (27, 16, '2023-03-24');

-- Insert data into Transplant Table -- 3 cuttings * 16 cuts * 27 mothers = 1296 -- TransplantDate = CutDate + 13 days
INSERT INTO Transplant (CutID, TransplantDate) --(2023-02-26)
VALUES
    (1, '2023-07-20'),
    (2, '2023-07-22'),
    (3, '2023-07-21'),
    (4, '2023-07-21'),
    (5, '2023-07-23'),
    (6, '2023-07-22');

-- Insert data into Daughter Table -- 4 cuttings * 52 cuts * 27 mothers = 5616 --DateHarvested + 7 days
INSERT INTO Daughter (MotherID, Price, Packaged, TransplantID, GeneticMarkerID, PhenotypicMarkerID, DateHarvested) --(2023-03-07)
VALUES --HealthStatus all must = 1 for Healthy status 
    (1, 10.5, 1, 1, 1, 1, '2023-08-15'),
    (2, 11.2, 1, 2, 2, 2, '2023-08-17'),
    (3, 9.8, 1, 3, 3, 3, '2023-08-16'),
    (4, 10.7, 1, 4, 1, 1, '2023-08-16'),
    (5, 11.4, 1, 5, 2, 2, '2023-08-18'),
    (6, 9.9, 1, 6, 3, 3, '2023-08-17');

-- Create constraints, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constraints and indexes for the remaining tables in your schema.
