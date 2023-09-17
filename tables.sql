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
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
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
    PhenotypicMarkerID INT NOT NULL,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StrainSeedBagID) REFERENCES StrainSeedBag(StrainSeedBagID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
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
    SeedlingID INT UNIQUE,
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
    ('Vendor1'),
    ('Vendor2'),
    ('Vendor3');

-- Insert data into GeneticMarker Table
INSERT INTO GeneticMarker (Genus, Species)
VALUES
    ('Cannabis', 'Sativa'),
    ('Cannabis', 'Indica'),
    ('Cannabis', 'Hybrid');

-- Insert data into PhenotypicMarker Table
INSERT INTO PhenotypicMarker (MarkerName, GeneticMarkerID, NumberOfBranches, Height, LeafColour)
VALUES
    ('Marker1', 1, 5, 20, 'Green'),
    ('Marker2', 2, 4, 18, 'Purple'),
    ('Marker3', 3, 6, 22, 'Blue');

-- Insert data into Strain Table
INSERT INTO Strain (NickName, FirstName, MiddleName, LastName, BreederVendorID)
VALUES
    ('Strain1', 'First1', 'Middle1', 'Last1', 1),
    ('Strain2', 'First2', 'Middle2', 'Last2', 2),
    ('Strain3', 'First3', 'Middle3', 'Last3', 3);

-- Insert data into StrainSeedBag Table
INSERT INTO StrainSeedBag (StrainID, BreederVendorID, StrainSeedBagName, PackageUnits, DateReceived)
VALUES
    (1, 1, 'SeedPack1', 10, '2023-01-11'),
    (2, 2, 'SeedPack2', 15, '2023-02-15'),
    (3, 3, 'SeedPack3', 20, '2023-03-20');

-- Insert data into Seed Table
INSERT INTO Seed (StrainSeedBagID, BreederVendorID, GeneticMarkerID, PhenotypicMarkerID)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 3),
    (1, 1, 1, 2),
    (2, 2, 2, 3),
    (3, 3, 3, 1),
    (1, 1, 1, 3),
    (2, 2, 2, 1),
    (3, 3, 3, 2);

-- Insert data into Seeding Table
INSERT INTO Seeding (SeedID, StrainSeedBagID, DatePlanted)
VALUES
    (1, 1, '2023-04-01'),
    (2, 2, '2023-04-05'),
    (3, 3, '2023-04-10'),
    (4, 1, '2023-04-02'),
    (5, 2, '2023-04-06'),
    (6, 3, '2023-04-11'),
    (7, 1, '2023-04-03'),
    (8, 2, '2023-04-07'),
    (9, 3, '2023-04-12');

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SeedingID, SproutDate, Age)
VALUES
    (1, 1, '2023-04-15', 14),
    (2, 2, '2023-04-19', 12),
    (3, 3, '2023-04-24', 11),
    (4, 4, '2023-04-16', 13),
    (5, 5, '2023-04-20', 11),
    (6, 6, '2023-04-25', 10),
    (7, 7, '2023-04-17', 13),
    (8, 8, '2023-04-21', 12),
    (9, 9, '2023-04-26', 10);

-- Insert data into Mothers Table
INSERT INTO Mothers (SeedlingID, DateMothered, NumberOfBranches, LeafColour, PhenotypicMarkerID, GeneticMarkerID, StrainID)
VALUES
    (1, '2023-06-01', 6, 'Green', 1, 1, 1),
    (2, '2023-06-05', 5, 'Purple', 2, 2, 2),
    (3, '2023-06-10', 7, 'Blue', 3, 3, 3),
    (4, '2023-06-02', 6, 'Purple', 1, 1, 1),
    (5, '2023-06-06', 5, 'Blue', 2, 2, 2),
    (6, '2023-06-11', 7, 'Green', 3, 3, 3);

-- Insert data into Maturity Table
INSERT INTO Maturity (MotherID, DateOfMaturityCheck, Height, NumberOfBranches, LeafColour)
VALUES
    (1, '2023-07-01', 40, 12, 'Green'),
    (2, '2023-07-05', 38, 11, 'Purple'),
    (3, '2023-07-10', 42, 13, 'Blue'),
    (4, '2023-07-02', 39, 12, 'Purple'),
    (5, '2023-07-06', 37, 11, 'Blue'),
    (6, '2023-07-11', 41, 13, 'Green');

-- Insert data into Cutting Table
INSERT INTO Cutting (MotherID, NumberOfCuts, CutDate)
VALUES
    (1, 8, '2023-07-15'),
    (2, 9, '2023-07-17'),
    (3, 7, '2023-07-16'),
    (4, 8, '2023-07-16'),
    (5, 9, '2023-07-18'),
    (6, 7, '2023-07-17');

-- Insert data into Transplant Table
INSERT INTO Transplant (CutID, TransplantDate)
VALUES
    (1, '2023-07-20'),
    (2, '2023-07-22'),
    (3, '2023-07-21'),
    (4, '2023-07-21'),
    (5, '2023-07-23'),
    (6, '2023-07-22');

-- Insert data into Daughter Table
INSERT INTO Daughter (MotherID, Price, Packaged, TransplantID, GeneticMarkerID, PhenotypicMarkerID, DateHarvested)
VALUES
    (1, 10.5, 1, 1, 1, 1, '2023-08-15'),
    (2, 11.2, 1, 2, 2, 2, '2023-08-17'),
    (3, 9.8, 1, 3, 3, 3, '2023-08-16'),
    (4, 10.7, 1, 4, 1, 1, '2023-08-16'),
    (5, 11.4, 1, 5, 2, 2, '2023-08-18'),
    (6, 9.9, 1, 6, 3, 3, '2023-08-17');

-- Create constras, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constras and indexes for the remaining tables in your schema.
