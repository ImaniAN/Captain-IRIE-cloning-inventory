-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    VendorName VARCHAR(150) UNIQUE
);

-- Create the SeedStore Table
CREATE TABLE SeedStore (
    SeedStoreID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedStoreName VARCHAR(150),
    BreederVendorID SMALLINT.
    PackageUnits INT,
    ExpirationDate DATE, -- (date recivued plus 2 years)
    DateReceived DATE DEFAULT GETDATE() 
    --TODO: run a query for the diference between PackagingDate - DateReceived to find out how old seeds are before we get them
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Genus VARCHAR(150),
    Species VARCHAR(150) UNIQUE
);

-- Create the Phenotypic Marker Table
CREATE TABLE PhenotypicMarker (
    PhenotypicMarkerID SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MarkerName VARCHAR(150) UNIQUE,
    GeneticMarkerID SMALLINT,
    NumberOfBranches INT,
    Height INT,
    LeafColour VARCHAR(150),
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedStoreID INT,
    BreederVendorID VARCHAR(150),
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedStoreID) REFERENCES SeedStore(SeedStoreID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedID INT UNIQUE,
    SeedStoreID INT,
    DatePlanted DATE,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedStoreID) REFERENCES SeedStore(SeedStoreID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedID INT UNIQUE,
    SeedingID INT,
    SproutDate DATE,
    Age INT, --Dateplanted - sproutdate = age
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedingID) REFERENCES Seeding(SeedingID)
      ON UPDATE CASCADE ON DELETE CASCADE

);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedlingID INT UNIQUE,
    DateMothered DATE,
    Age INT, --DatePlated - DateMothered = age
    NumberOfBranches INT,
    LeafColour VARCHAR(150),
    PhenotypicMarkerID SMALLINT,
    GeneticMarkerID SMALLINT,
    FOREIGN KEY (SeedlingID) REFERENCES Seedling(SeedlingID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Maturity Table
CREATE TABLE Maturity (
    MaturityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MotherID INT,
    MaturityDate DATE,
    Age INT, --DatePlatented - MaturityDate = Age
    Height INT,
    NumberOfBranches INT,
    LeafColour VARCHAR(150),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaturityID INT UNIQUE,
    NumberOfCuts SMALLINT,
    CutDate DATE,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CutID INT,
    TransplantDate DATE,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MotherID INT,
    Price SMALLINT,
    Packaged BOOLEAN,
    TransplantID INT UNIQUE,
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    DateDaughtered DATE,
    Age INT, --CutDate - TransplantDate = Age
    LeafColour VARCHAR(150),
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- Create the Strain Table
CREATE TABLE Strain (
    StrainID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    NickName VARCHAR(150),
    FirstName VARCHAR(150),
    MiddleName VARCHAR(150),
    LastName VARCHAR(150),
    DaughterID INT UNIQUE,
    FOREIGN KEY (DaughterID) REFERENCES Daughter(DaughterID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create primary key indexes and additional indexes as needed
-- (e.g., indexes for frequently queried columns, non-clustered indexes, etc.)

-- Indexes for SeedBreederVendor Table
CREATE INDEX idx_SeedBreederVendor_GeneticMarkerID ON BreederVendor (BreederVendorID);
CREATE UNIQUE INDEX UI_SeedBreederVendor_VendorName ON GeneticMarker (VendorName);

-- Indexes for SeedStore Table
CREATE INDEX idx_SeedStore_SeedID ON SeedStore (SeedID);
CREATE INDEX idx_SeedStore_PackagingDate ON SeedStore (PackagingDate);
CREATE INDEX idx_SeedStore_ExpirationDate ON SeedStore (ExpirationDate);
CREATE INDEX idx_SeedStore_DateReceived ON SeedStore (DateReceived);

-- Indexes for GeneticMarker Table
CREATE INDEX idx_GeneticMarker_GeneticMarkerID ON GeneticMarker (GeneticMarkerID);
CREATE UNIQUE INDEX UI_GeneticMarker_Species ON GeneticMarker (Species);

-- Indexes for PhenotypicMarker Table
CREATE INDEX idx_PhenotypicMarker_PhenotypicMarkerID ON PhenotypicMarker (PhenotypicMarkerID);
CREATE UNIQUE INDEX UI_PhenotypicMarker_MarkerName ON PhenotypicMarker (MarkerName);
CREATE INDEX idx_PhenotypicMarker_GeneticMarkerID ON PhenotypicMarker (GeneticMarkerID);

-- Indexes for Seed Table
CREATE INDEX idx_Seed_BreederVendorID ON Seed (BreederVendorID);
CREATE INDEX idx_Seed_GeneticMarkerID ON Seed (GeneticMarkerID);
CREATE INDEX idx_Seed_PhenotypicMarkerID ON Seed (PhenotypicMarkerID);

-- Indexes for Seeding Table
CREATE UNIQUE INDEX UI_Seeding_SeedID ON Seeding (SeedID);
CREATE INDEX idx_Seeding_SeedStoreID ON Seeding (SeedStoreID);
CREATE INDEX idx_Seeding_DatePlanted ON Seeding (DatePlanted);

-- Indexes for Seedling Table
CREATE UNIQUE INDEX UI_Seedling_SeedID ON Seedling (SeedID);
CREATE INDEX idx_Seedling_SeedingID ON Seedling (SeedingID);
CREATE INDEX idx_Seedling_SproutDate ON Seedling (SproutDate);
CREATE INDEX idx_Seedling_Age ON Seedling (Age);

-- Indexes for Mothers Table
CREATE UNIQUE INDEX UI_Mothers_SeedlingID ON Mothers (SeedlingID);
CREATE INDEX idx_MothersDateMothered ON Mothers (DateMothered);
CREATE INDEX idx_Mothers_Age ON Mothers (Age);
CREATE INDEX idx_Mothers_PhenotypicMarkerID ON Mothers (PhenotypicMarkerID);
CREATE INDEX idx_Mothers_GeneticMarkerID ON Mothers (GeneticMarkerID);

-- Indexes for Maturity Table
CREATE INDEX idx_Maturity_MaturityID ON Maturity (MaturityID);
CREATE INDEX idx_Maturity_MotherID ON Maturity (MotherID);
CREATE INDEX idx_Maturity_MaturityDate ON Maturity (MaturityDate);
CREATE INDEX idx_Maturity_Age ON Maturity (Age);
CREATE INDEX idx_Maturity_Height ON Maturity (Height);

-- Indexes for Cutting Table
CREATE INDEX idx_Cutting_CutID ON Cutting (CutID);
CREATE INDEX idx_Cutting_MaturityID ON Cutting (MaturityID);
CREATE INDEX idx_Cutting_CutDate ON Cutting (CutDate);

-- Indexes for Transplant Table
CREATE INDEX idx_Transplant_TransplantID ON Transplant (TransplantID);
CREATE INDEX idx_Transplant_CutID ON Transplant (CutID);

-- Indexes for Daughter Table
CREATE INDEX idx_Daughter_MotherID ON Daughter (MotherID);
CREATE INDEX idx_Daughter_Packaged ON Daughter (Packaged);
CREATE UNIQUE INDEX UI_Daughter_TransplantID ON Daughter (TransplantID);
CREATE INDEX idx_Daughter_GeneticMarkerID ON Daughter (GeneticMarkerID);
CREATE INDEX idx_Daughter_PhenotypicMarkerID ON Daughter (PhenotypicMarkerID);
CREATE INDEX idx_Daughter_Age ON Daughter (Age);
CREATE INDEX idx_Daughter_DateDaughtered ON Daughter (DateDaughtered);

-- Indexes for Strain Table
CREATE INDEX idx_Strain_DaughterID ON Strain (DaughterID);

-- Insert data into SeedBreederVendor Table
INSERT INTO SeedBreederVendor (VendorName)
VALUES
    ('MarijuanaSouthAfrica'),
    ('GrowWeedAfrica'),
    ('BagSeeds'),
    ('Vendor1');

-- Insert data into SeedStore Table
INSERT INTO SeedStore (SeedStoreName, PackageUnits, BreederVendorID, ExpirationDate, DateReceived)
VALUES
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack1', 3, 1, '2024-12-31', '2023-01-11'),
    ('SeedPack2', 5, 2, '2024-12-31', '2023-01-11'),
    ('SeedPack2', 5, 2, '2024-12-31', '2023-01-11'),
    ('SeedPack2', 5, 2, '2024-12-31', '2023-01-11'),
    ('SeedPack2', 5, 2, '2024-12-31', '2023-01-11'),
    ('Bagseeds', 37, 3, '2024-12-31', '2023-03-11'),
    ('Bagseeds', 737, 3, '2024-12-31', '2023-03-11'),
    ('Bagseeds', 237, 3, '2024-12-31', '2023-03-11'),
    ('Bagseeds', 37, 3, '2024-12-31', '2023-03-11'),
    ('Bagseeds', 17, 3, '2024-12-31', '2023-03-11'),
    ('Bagseeds', 2200, 3, '2023-10-31', '2023-03-03');

-- Insert data into GeneticMarker Table
INSERT INTO GeneticMarker (Genus, Species)
VALUES
    ('Cannabis', 'Sativa'),
    ('Cannabis', 'Indica'),
    ('Cannabis', 'Hybrid');

-- Insert data into PhenotypicMarker Table
INSERT INTO PhenotypicMarker (MarkerName, GeneticMarkerID, NumberOfBranches, Height, LeafColour)
VALUES
    -- Cannabis Sativa PhenotypicMarkers
    ('Seedling Stage (Sativa)', 1, 2, 5, 'Green (Light)', ),
    ('Early Vegetative Stage (Sativa)', 1, 6, 20, 'Green (Medium)'),
    ('Late Vegetative Stage (Sativa)', 1, 12, 40, 'Green (Dark)'),
    ('Pre-Flowering Stage (Sativa)', 1, 18, 70, 'Green (Dark)'),
    ('Early Flowering Stage (Sativa)', 1, 24, 100, 'Varied (Light to Dark)'),
    ('Mid-Flowering Stage (Sativa)', 1, 30, 150, 'Varied (Light to Dark)'),
    ('Late Flowering Stage (Sativa)', 1, 36, 200, 'Varied (Light to Dark)'),
    ('Mid-Maturity Stage (Sativa)', 1, 42, 220, 'Autumn Colors'),
    ('Mid-Harvest Stage (Sativa)', 1, 48, 240, 'Drying and Curing'),
    ('Post-Harvest Stage (Sativa)', 1, 50, 254, 'Drying and Curing'),

    -- Cannabis Indica PhenotypicMarkers
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

    -- Cannabis Hybrid PhenotypicMarkers
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


-- Insert data into Seed Table
INSERT INTO Seed (SeedStoreID, BreederVendorID, GeneticMarkerID, PhenotypicMarkerID)
VALUES
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (1, 1, 1, 1),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (1, 1, 1, 1),
    (3, 2, 2, 2),
    (3, 2, 2, 2),
    (7, 3, 3, 3);

-- Insert data into Seeding Table
INSERT INTO Seeding (SeedID, SeedStoreID, DatePlanted)
VALUES
    (1, 9, '2023-04-01'),
    (23, 1, '2023-05-01'),
    (1, 9, '2023-04-01'),
    (1, 9, '2023-04-01'),
    (23, 1, '2023-05-01'),
    (1, 9, '2023-04-01'),
    (23, 1, '2023-05-01'),
    (19, 4, '2023-06-01');

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SeedingID, SproutDate, Age)
VALUES
    (1, 1, '2023-04-15', 1),
    (2, 2, '2023-05-15', 3),
    (1, 1, '2023-04-15', 1),
    (2, 2, '2023-05-15', 3),
    (1, 1, '2023-04-15', 1),
    (2, 2, '2023-05-15', 3),
    (1, 1, '2023-04-15', 1),
    (2, 2, '2023-05-15', 3),
    (1, 1, '2023-04-15', 1),
    (2, 2, '2023-05-15', 3),
    (1, 1, '2023-04-15', 1),
    (2, 2, '2023-05-15', 3),
    (3, 3, '2023-06-15', 4);

-- Insert data into Mothers Table
INSERT INTO Mothers (SeedlingID, DateMothered, Age, NumberOfBranches, PhenotypicMarkerID, GeneticMarkerID)
VALUES
    (1, '2023-07-01', 61, 3, 1, 1),
    (2, '2023-07-01', 72, 9, 2, 2),
    (3, '2023-07-01', 83, 5, 3, 3);

-- Insert data into Maturity Table
INSERT INTO Maturity (MotherID, MaturityDate, Age, Height, NumberOfBranches, LeafShape, LeafColour)
VALUES
    (1, '2023-07-01', 15, 30, 12, 'Green'), -- MaturityID = 1
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (1, '2023-07-01', 15, 30, 12, 'Green'),
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (2, '2023-07-01', 15, 30, 12, 'Green'), -- MaturityID = 5
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (1, '2023-07-01', 15, 30, 12, 'Green'),
    (3, '2023-07-02', 14, 32, 11, 'Purpule'), -- MaturityID = 9
    (1, '2023-07-01', 15, 30, 12, 'Green'),
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (1, '2023-07-01', 15, 30, 12, 'Green'), -- MaturityID = 14
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (1, '2023-07-01', 15, 30, 12, 'Green'),
    (2, '2023-07-02', 14, 32, 11, 'Purpule'),
    (3, '2023-07-03', 16, 28, 10, 'Brown');

-- Insert data into Cutting Table
INSERT INTO Cutting (MaturityID, NumberOfCuts, CutDate)
VALUES
    (1, 13, '2023-07-15'),
    (5, 17, '2023-07-17'),
    (9, 13, '2023-07-15'),
    (11, 12, '2023-07-16'),
    (14, 21, '2023-07-16');

-- Insert data into Transplant Table
INSERT INTO Transplant (CutID, TransplantDate)
VALUES
    (1, '2023-07-20'),
    (1, '2023-07-21'),
    (1, '2023-07-20'),
    (1, '2023-07-21'),
    (1, '2023-07-20'),
    (1, '2023-07-21'),
    (1, '2023-07-20'),
    (1, '2023-07-21'),
    (1, '2023-07-20'),
    (1, '2023-07-21'),
    (1, '2023-07-20'),
    (9, '2023-07-21'),
    (9, '2023-07-20'),
    (9, '2023-07-21'),
    (9, '2023-07-20'),
    (9, '2023-07-21'),
    (9, '2023-07-20'),
    (9, '2023-07-21'),
    (9, '2023-07-20'),
    (9, '2023-07-21'),
    (11, '2023-07-21'),
    (11, '2023-07-20'),
    (11, '2023-07-21'),
    (11, '2023-07-20'),
    (11, '2023-07-21'),
    (11, '2023-07-20'),
    (11, '2023-07-21'),
    (11, '2023-07-21'),
    (11, '2023-07-20'),
    (11, '2023-07-21'),
    (11, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-20'),
    (14, '2023-07-21'),
    (14, '2023-07-22');

-- Insert data into Daughter Table
INSERT INTO Daughter (MotherID, Price, Packaged, TransplantID, GeneticMarkerID, PhenotypicMarkerID, DateDaughtered, Age, LeafColour)
VALUES
    (1, 199, 1, 1, 1, 1, '2023-07-25', 5, 'Green'),
    (1, 199, 0, 2, 2, 2, '2023-07-26', 4, 'Lime'),
    (1, 199, 1, 3, 1, 3, '2023-07-25', 5, 'Green'),
    (1, 199, 0, 4, 2, 2, '2023-07-26', 4, 'Lime'),
    (1, 199, 1, 5, 1, 1, '2023-07-25', 5, 'Green'),
    (1, 199, 0, 6, 2, 2, '2023-07-26', 4, 'Lime'),
    (1, 199, 1, 7, 1, 1, '2023-07-25', 5, 'Green'),
    (1, 199, 1, 8, 1, 1, '2023-07-25', 5, 'Green'),
    (1, 199, 0, 9, 2, 2, '2023-07-26', 4, 'Lime'),
    (1, 199, 1, 10, 1, 1, '2023-07-25', 5, 'Green'),
    (1, 199, 0, 11, 2, 2, '2023-07-26', 4, 'Lime'),
    (1, 199, 1, 12, 1, 1, '2023-07-25', 5, 'Green'),
    (3, 199, 0, 14, 2, 2, '2023-07-26', 4, 'Lime'),
    (3, 199, 1, 15, 1, 1, '2023-07-25', 5, 'Green'),
    (3, 199, 0, 16, 2, 2, '2023-07-26', 4, 'Lime'),
    (3, 199, 1, 17, 1, 3, '2023-07-25', 5, 'Green'),
    (3, 199, 0, 18, 2, 2, '2023-07-26', 4, 'Lime'),
    (3, 199, 1, 19, 1, 1, '2023-07-25', 5, 'Green'),
    (3, 199, 0, 20, 2, 2, '2023-07-26', 4, 'Lime'),
    (2, 199, 1, 21, 1, 1, '2023-07-25', 5, 'Green'),
    (2, 199, 1, 22, 1, 1, '2023-07-25', 5, 'Green'),
    (2, 199, 0, 23, 2, 2, '2023-07-26', 4, 'Lime'),
    (2, 199, 1, 24, 1, 1, '2023-07-25', 5, 'Green'),
    (2, 199, 0, 25, 2, 2, '2023-07-26', 4, 'Lime'),
    (2, 199, 1, 27, 1, 1, '2023-07-25', 5, 'Green'),
    (2, 199, 0, 28, 2, 2, '2023-07-26', 4, 'Lime'),
    (2, 199, 1, 29, 3, 3, '2023-07-27', 3, 'Brown');

-- Insert data into Strain Table
INSERT INTO Strain (NickName, FirstName, MiddleName, LastName, DaughterID)
VALUES
    ('Strain1', 'First1', 'Middle1', 'Last1', 1),
    ('Strain2', 'First2', 'Middle2', 'Last2', 2),
    ('Strain1', 'First1', 'Middle1', 'Last1', 3);

-- Create constras, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constras and indexes for the remaining tables in your schema.
