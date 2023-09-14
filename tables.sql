-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID SMALLINT IDENTITY(1,1) PRIMARY KEY,
    VendorName VARCHAR(50) UNIQUE
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID SMALLINT IDENTITY(1,1) PRIMARY KEY,
    Genus VARCHAR(50),
    Species VARCHAR(50)
); -- Cannabis sativa, indica and hybrid

-- Create the Phenotypic Marker Table
CREATE TABLE PhenotypicMarker (
    PhenotypicMarkerID SMALLINT IDENTITY(1,1) PRIMARY KEY,
    GeneticMarkerID SMALLINT,
    MarkerName VARCHAR(50) UNIQUE,
    NumberofNodes INT,
    Height SMALLINT,
    Colour VARCHAR(50),
    LeafShape VARCHAR(50), --Leaves can be broad or narrow
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT IDENTITY(1,1) PRIMARY KEY,
    BreederVendorID SMALLINT,
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    PackID VARCHAR(50) DEFAULT 'BackSeed', -- Set your default value here
    PackagingID INT,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PackID) REFERENCES PackagingInfo(PackID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the PackagingInfo Table
CREATE TABLE PackagingInfo (
    PackagingInfoID INT IDENTITY(1,1) PRIMARY KEY,
    SeedID INT,
    PackID VARCHAR(50), -- Set your default value here
    SeedBankID SMALLINT,
    PackageUnits SMALLINT,
    PackagingDate DATE,
    ExpirationDate DATE,
    DateReceived DATE DEFAULT GETDATE(), -- Set your default value here
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seed Bank Table
CREATE TABLE SeedBank (
    SeedBankID SMALLINT IDENTITY(1,1) PRIMARY KEY,
    SeedBankName VARCHAR(50),
    PackagingInfoID INT,
    FOREIGN KEY (PackagingInfoID) REFERENCES PackagingInfo(PackagingInfoID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT IDENTITY(1,1) PRIMARY KEY,
    SeedID INT,
    SeedBankID SMALLINT,
    DatePlanted DATE DEFAULT GETDATE(),
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT IDENTITY(1,1) PRIMARY KEY,
    SeedID INT,
    SeedingID INT,
    SproutDate DATE, --GETDATE() ???
    Age INT, --Dateplanted - sproutdate = age
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT IDENTITY(1,1) PRIMARY KEY,
    SeedlingID INT
    TimeGrown SMALLINT, --perform an age calultion of some sort here
    Nodes INT,
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
    MaturityID INT IDENTITY(1,1) PRIMARY KEY,
    MotherID INT,
    NumberOfBranches SMALLINT,
    MaturityDate DATE DEFAULT GETDATE(),
    BranchSites SMALLINT,
    Age INT, --DatePlatented - MaturityDate = Age
    Height SMALLINT,
    Nodes SMALLINT,
    LeafShape VARCHAR(50),
    Color VARCHAR(50),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT IDENTITY(1,1) PRIMARY KEY,
    CutDate DATE DEFAULT GETDATE(),
    NumberOfCuts SMALLINT,
    MaturityID INT,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT IDENTITY(1,1) PRIMARY KEY,
    CutID INT
    TransplantDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT IDENTITY(1,1) PRIMARY KEY,
    CutID INT,
    MotherID INT,
    Price SMALLINT,
    Packaged BOOLEAN,
    TransplantID INT,
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    DateDaughtered DATE DEFAULT GETDATE(),
    Age INT, --CutDate - TransplantDate = Age
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- Create the Strain Table
CREATE TABLE Strain (
    StrainID SMALLINT IDENTITY(1,1) PRIMARY KEY,
    NickName VARCHAR(50),
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    DaughterID SMALLINT,
    FOREIGN KEY (DaughterID) REFERENCES Daughter(DaughterID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create primary key indexes and additional indexes as needed
-- (e.g., indexes for frequently queried columns, non-clustered indexes, etc.)
-- Indexes for Seed Table
CREATE INDEX idx_Seed_BreederVendorID ON Seed (BreederVendorID);
CREATE INDEX idx_Seed_GeneticMarkerID ON Seed (GeneticMarkerID);
CREATE INDEX idx_Seed_PhenotypicMarkerID ON Seed (PhenotypicMarkerID);
CREATE INDEX idx_Seed_DateReceived ON Seed (DateReceived);
CREATE INDEX idx_Seed_PackID ON Seed (PackID);

-- Indexes for PackagingInfo Table
CREATE INDEX idx_PackagingInfo_SeedID ON PackagingInfo (SeedID);
CREATE INDEX idx_PackagingInfo_SeedBankID ON PackagingInfo (SeedBankID);

-- Indexes for SeedBank Table
CREATE INDEX idx_SeedBank_SeedID ON SeedBank (SeedID);
CREATE INDEX idx_SeedBank_Quantity ON SeedBank (Quantity);

-- Indexes for Seeding Table
CREATE INDEX idx_Seeding_SeedID ON Seeding (SeedID);
CREATE INDEX idx_Seeding_SeedBankID ON Seeding (SeedBankID);
CREATE INDEX idx_Seeding_DatePlanted ON Seeding (DatePlanted);

-- Indexes for Seedling Table
CREATE INDEX idx_Seedling_SeedID ON Seedling (SeedID);
CREATE INDEX idx_Seedling_SeedingID ON Seedling (SeedingID);
CREATE INDEX idx_Seedling_SproutDate ON Seedling (SproutDate);
CREATE INDEX idx_Seedling_Age ON Seedling (Age);

-- Indexes for Mothers Table
CREATE INDEX idx_Mothers_SeedlingID ON Mothers (SeedlingID);
CREATE INDEX idx_Mothers_PhenotypicMarkerID ON Mothers (PhenotypicMarkerID);
CREATE INDEX idx_Mothers_GeneticMarkerID ON Mothers (GeneticMarkerID);
CREATE INDEX idx_Mothers_TimeGrown ON Mothers (TimeGrown);

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
CREATE INDEX idx_Daughter_MotherID ON Daughter (MotherID);
CREATE INDEX idx_Daughter_TransplantID ON Daughter (TransplantID);
CREATE INDEX idx_Daughter_GeneticMarkerID ON Daughter (GeneticMarkerID);
CREATE INDEX idx_Daughter_PhenotypicMarkerID ON Daughter (PhenotypicMarkerID);
CREATE INDEX idx_Daughter_DateDaughtered ON Daughter (DateDaughtered);
CREATE INDEX idx_Daughter_Age ON Daughter (Age);

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
    ('Genus1', 'Species1'),
    ('Genus2', 'Species2'),
    ('Genus3', 'Species3');

-- Insert data into PhenotypicMarker Table
INSERT INTO PhenotypicMarker (MarkerName, GeneticMarkerID, NumberofNodes, Height, Colour, LeafShape)
VALUES
    ('Marker1', 1, 5, 10, 'Green', 'Broad'),
    ('Marker2', 2, 7, 12, 'Red', 'Narrow'),
    ('Marker3', 3, 6, 11, 'Blue', 'Broad');

-- Insert data into Seed Table
INSERT INTO Seed (BreederVendorID, GeneticMarkerID, PhenotypicMarkerID, PackID)
VALUES
    (1, 1, 1, 'SeedPack1'),
    (2, 2, 2, 'SeedPack2'),
    (3, 3, 3, 'SeedPack3');

-- Insert data into PackagingInfo Table
INSERT INTO PackagingInfo (SeedID, PackID, SeedBankID, PackageUnits, PackagingDate, ExpirationDate)
VALUES
    (1, 'SeedPack1', 101, 100, '2023-01-01', '2023-12-31'),
    (2, 'SeedPack2', 102, 150, '2023-02-01', '2023-11-30'),
    (3, 'SeedPack3', 103, 200, '2023-03-01', '2023-10-31');

-- Insert data into SeedBank Table
INSERT INTO SeedBank (SeedBankName, PackagingInfoID)
VALUES
    ('Bank1', 1),
    ('Bank2', 2),
    ('Bank3', 3);

-- Insert data into Seeding Table
INSERT INTO Seeding (SeedID, SeedBankID, DatePlanted)
VALUES
    (1, 101, '2023-04-01'),
    (2, 102, '2023-05-01'),
    (3, 103, '2023-06-01');

-- Insert data into Seedling Table
INSERT INTO Seedling (SeedID, SeedingID, SproutDate, Age)
VALUES
    (1, 1, '2023-04-15', 14),
    (2, 2, '2023-05-15', 14),
    (3, 3, '2023-06-15', 14);

-- Insert data into Mothers Table
INSERT INTO Mothers (SeedlingID, TimeGrown, Nodes, PhenotypicMarkerID, GeneticMarkerID)
VALUES
    (1, 30, 8, 1, 1),
    (2, 31, 9, 2, 2),
    (3, 32, 7, 3, 3);

-- Insert data into Maturity Table
INSERT INTO Maturity (MotherID, NumberOfBranches, MaturityDate, BranchSites, Age, Height, Nodes, LeafShape, Color)
VALUES
    (1, 20, '2023-07-01', 10, 15, 30, 12, 'Broad', 'Green'),
    (2, 18, '2023-07-02', 8, 14, 32, 11, 'Narrow', 'Red'),
    (3, 22, '2023-07-03', 12, 16, 28, 10, 'Broad', 'Blue');

-- Insert data into Cutting Table
INSERT INTO Cutting (MaturityID, NumberOfCuts, CutDate)
VALUES
    (1, 3, '2023-07-15'),
    (2, 2, '2023-07-16'),
    (3, 4, '2023-07-17');

-- Insert data into Transplant Table
INSERT INTO Transplant (CutID, TransplantDate)
VALUES
    (1, '2023-07-20'),
    (2, '2023-07-21'),
    (3, '2023-07-22');

-- Insert data into Daughter Table
INSERT INTO Daughter (CutID, MotherID, Price, Packaged, TransplantID, GeneticMarkerID, PhenotypicMarkerID, DateDaughtered, Age)
VALUES
    (1, 1, 5, 1, 1, 1, 1, '2023-07-25', 5),
    (2, 2, 6, 0, 2, 2, 2, '2023-07-26', 4),
    (3, 3, 4, 1, 3, 3, 3, '2023-07-27', 3);

-- Insert data into Strain Table
INSERT INTO Strain (NickName, FirstName, MiddleName, LastName, DaughterID)
VALUES
    ('Strain1', 'First1', 'Middle1', 'Last1', 1),
    ('Strain2', 'First2', 'Middle2', 'Last2', 2),
    ('Strain3', 'First3', 'Middle3', 'Last3', 3);

-- Create constras, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constras and indexes for the remaining tables in your schema.
