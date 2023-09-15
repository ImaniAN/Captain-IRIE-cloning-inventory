-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    VendorName VARCHAR(50) UNIQUE
);

-- Create the SeedStore Table
CREATE TABLE SeedStore (
    SeedStoreID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedStorerName VARCHAR(50),
    PackageUnits SMALLINT,
    PackagingDate DATE,
    ExpirationDate DATE,
    DateReceived DATE DEFAULT GETDATE()
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Genus VARCHAR(50),
    Species VARCHAR(50) UNIQUE
);

-- Create the Phenotypic Marker Table
CREATE TABLE PhenotypicMarker (
    PhenotypicMarkerID SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    GeneticMarkerID SMALLINT,
    MarkerName VARCHAR(50) UNIQUE,
    NumberOfBranches INT,
    Height INT,
    Colour VARCHAR(50),
    LeafShape VARCHAR(50),
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedStoreID INT,
    BreederVendorID VARCHAR(50),
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
    SeedID INT,
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
    SeedID INT,
    SeedingID INT,
    SproutDate DATE,
    Age INT, --Dateplanted - sproutdate = age
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedingID) REFERENCES Seeding(SeedingID)
      ON UPDATE CASCADE ON DELETE CASCADE,

);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedlingID INT
    DateMothered DATE,
    Age INT, --DatePlated - DateMothered = age
    NumberOfBranches INT,
    Colour VARCHAR(50),
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
    Colour VARCHAR(50),
    NumberOfBranches INT,
    LeafShape VARCHAR(50),
    Color VARCHAR(50),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CutDate DATE,
    NumberOfCuts SMALLINT,
    MaturityID INT,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TransplantDate DATE,
    CutID INT
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CutID INT,
    Packaged BOOLEAN,
    DateDaughtered DATE,
    Age INT, --CutDate - TransplantDate = Age
    Price SMALLINT,
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    Colour VARCHAR(50),
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- Create the Strain Table
CREATE TABLE Strain (
    StrainID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    NickName VARCHAR(50),
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    DaughterID INT,
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
CREATE INDEX idx_Seeding_SeedID ON Seeding (SeedID);
CREATE INDEX idx_Seeding_SeedStoreID ON Seeding (SeedStoreID);
CREATE INDEX idx_Seeding_DatePlanted ON Seeding (DatePlanted);

-- Indexes for Seedling Table
CREATE INDEX idx_Seedling_SeedID ON Seedling (SeedID);
CREATE INDEX idx_Seedling_SeedingID ON Seedling (SeedingID);
CREATE INDEX idx_Seedling_SproutDate ON Seedling (SproutDate);
CREATE INDEX idx_Seedling_Age ON Seedling (Age);

-- Indexes for Mothers Table
CREATE INDEX idx_Mothers_SeedlingID ON Mothers (SeedlingID);
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

-- Indexes for Transplant Table
CREATE INDEX idx_Transplant_TransplantID ON Transplant (TransplantID);

-- Indexes for Daughter Table
CREATE INDEX idx_Daughter_CutID ON Daughter (CutID);
CREATE INDEX idx_Daughter_Packaged ON Daughter (Packaged);
CREATE INDEX idx_Daughter_DateDaughtered ON Daughter (DateDaughtered);
CREATE INDEX idx_Daughter_Age ON Daughter (Age);
CREATE INDEX idx_Daughter_GeneticMarkerID ON Daughter (GeneticMarkerID);
CREATE INDEX idx_Daughter_PhenotypicMarkerID ON Daughter (PhenotypicMarkerID);

-- Indexes for Strain Table
CREATE INDEX idx_Strain_DaughterID ON Strain (DaughterID);

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
INSERT INTO PhenotypicMarker (MarkerName, GeneticMarkerID, NumberOfBranches, Height, Colour, LeafShape)
VALUES
    ('Marker1', 1, 5, 10, 'Green', 'Broad'),
    ('Marker2', 2, 7, 12, 'Purple', 'Narrow'),
    ('Marker3', 3, 6, 11, 'Brown', 'Broad');

-- Insert data into Seed Table
INSERT INTO Seed (BreederVendorID, GeneticMarkerID, PhenotypicMarkerID, PackName)
VALUES
    (1, 1, 1, 'SeedPack1'),
    (2, 2, 2, 'SeedPack2'),
    (3, 3, 3, 'SeedPack3');

-- Insert data into SeedStore Table
INSERT INTO SeedStore (SeedID, PackName, PackageUnits, PackagingDate, ExpirationDate)
VALUES
    (1, 'SeedPack1', 100, '2023-01-01', '2023-12-31'),
    (2, 'SeedPack2', 150, '2023-02-01', '2023-11-30'),
    (3, 'SeedPack3', 200, '2023-03-01', '2023-10-31');


-- Insert data into Seeding Table
INSERT INTO Seeding (SeedID, SeedStoreID, DatePlanted)
VALUES
    (1, 1, '2023-04-01'),
    (1, 1, '2023-05-01'),
    (1, 1, '2023-06-01');

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SeedingID, SproutDate, Age)
VALUES
    (1, 1, '2023-04-15', 2),
    (2, 2, '2023-05-15', 4),
    (3, 3, '2023-06-15', 3);

-- Insert data into Mothers Table
INSERT INTO Mothers (SeedlingID, Age, NumberOfBranches, PhenotypicMarkerID, GeneticMarkerID)
VALUES
    (1, 30, 8, 1, 1),
    (2, 31, 9, 2, 2),
    (3, 32, 7, 3, 3);

-- Insert data into Maturity Table
INSERT INTO Maturity (MotherID, NumberOfBranches, MaturityDate, BranchSites, Age, Height, NumberOfBranches, LeafShape, Color)
VALUES
    (1, 20, '2023-07-01', 10, 15, 30, 12, 'Broad', 'Green'),
    (2, 18, '2023-07-02', 8, 14, 32, 11, 'Narrow', 'Purpule'),
    (3, 22, '2023-07-03', 12, 16, 28, 10, 'Broad', 'Brown');

-- Insert data into Cutting Table
INSERT INTO Cutting (MaturityID, NumberOfCuts, CutDate)
VALUES
    (1, 13, '2023-07-15'),
    (2, 12, '2023-07-16'),
    (3, 14, '2023-07-17');

-- Insert data into Transplant Table
INSERT INTO Transplant (CutID, TransplantDate)
VALUES
    (1, '2023-07-20'),
    (2, '2023-07-21'),
    (3, '2023-07-22');

-- Insert data into Daughter Table
INSERT INTO Daughter (CutID, MotherID, Price, Packaged, TransplantID, GeneticMarkerID, PhenotypicMarkerID, DateDaughtered, Age)
VALUES
    (1, 1, 100, 1, 1, 1, 1, '2023-07-25', 5),
    (2, 2, 100, 0, 2, 2, 2, '2023-07-26', 4),
    (3, 3, 100, 1, 3, 3, 3, '2023-07-27', 3);

-- Insert data into Strain Table
INSERT INTO Strain (NickName, FirstName, MiddleName, LastName, DaughterID)
VALUES
    ('Strain1', 'First1', 'Middle1', 'Last1', 1),
    ('Strain2', 'First2', 'Middle2', 'Last2', 2),
    ('Strain3', 'First3', 'Middle3', 'Last3', 3);

-- Create constras, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constras and indexes for the remaining tables in your schema.
