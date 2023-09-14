-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    VendorName VARCHAR(50) UNIQUE
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    Genus VARCHAR(50),
    Species VARCHAR(50)
); -- Cannabis sativa, indica and hybrid

-- Create the Phenotypic Marker Table
CREATE TABLE PhenotypicMarker (
    PhenotypicMarkerID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    MarkerName VARCHAR(50) UNIQUE,
    GeneticMarkerID SMALLINT,
    NumberofNodes SMALLINT,
    Height SMALLINT DEFAULT 0,
    Colour VARCHAR(50),
    LeafShape VARCHAR(50), --Leaves can be broad or narrow
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    BreederVendorID SMALLINT,
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    PackID VARCHAR(50) DEFAULT 'BackSeed', -- Set your default value here
    PackagingID  SMALLINT,
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
    PackagingID SMALLINT IDENTITY(1,1) PRIMARY KEY,
    SeedID SMALLINT,
    PackID VARCHAR(50), -- Set your default value here
    SeedBankID SMALLINT,
    PackageUnits SMALLINT,
    PackagingDate  DATETIME,
    ExpirationDate  DATETIME,
    DateReceived DATE DEFAULT GETDATE(), -- Set your default value here
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seed Bank Table
CREATE TABLE SeedBank (
    SeedBankID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    SeedBankName VARCHAR(50),
    PackagingInfoID SMALLINT,
    FOREIGN KEY (PackagingInfoID) REFERENCES PackagingInfo(PackagingInfoID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    SeedID SMALLINT,
    SeedBankID SMALLINT,
    DatePlanted  DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    SeedID SMALLINT,
    SeedingID SMALLINT,
    SproutDate DATE, --GETDATE() ???
    Age SMALLINT DEFAULT 0, --Dateplanted - sproutdate = age
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    SeedlingID SMALLINT
    TimeGrown SMALLINT,
    Nodes SMALLINT,
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
    MaturityID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    MotherID SMALLINT,
    NumberOfBranches SMALLINT,
    MaturityDate  DATETIME DEFAULT GETDATE(),
    BranchSites SMALLINT,
    Age SMALLINT DEFAULT 0, --DatePlatented - MaturityDate = Age
    Height SMALLINT DEFAULT 0,
    Nodes SMALLINT,
    LeafShape VARCHAR(50),
    Color VARCHAR(50),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    CutDate  DATETIME DEFAULT GETDATE(),
    NumberOfCuts SMALLINT,
    MaturityID SMALLINT,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    CutID SMALLINT
    TransplantDate  DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
    CutID SMALLINT,
    MotherID SMALLINT,
    Price SMALLINT,
    Packaged BOOLEAN,
    TransplantID SMALLINT,
    GeneticMarkerID SMALLINT,
    PhenotypicMarkerID SMALLINT,
    DateDaughtered  DATETIME DEFAULT GETDATE(),
    Age SMALLINT DEFAULT 0, --CutDate - TransplantDate = Age
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
    StrainID  SMALLINT IDENTITY(1,1) PRIMARY KEY,
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

-- Indexes for Mothers Table
CREATE INDEX idx_Mothers_SeedlingID ON Mothers (SeedlingID);
CREATE INDEX idx_Mothers_PhenotypicMarkerID ON Mothers (PhenotypicMarkerID);
CREATE INDEX idx_Mothers_GeneticMarkerID ON Mothers (GeneticMarkerID);

-- Indexes for Maturity Table
CREATE INDEX idx_Maturity_MotherID ON Maturity (MotherID);

-- Indexes for Cutting Table
CREATE INDEX idx_Cutting_MotherID ON Cutting (MotherID);
CREATE INDEX idx_Cutting_MaturityID ON Cutting (MaturityID);

-- Indexes for Transplant Table
CREATE INDEX idx_Transplant_MotherID ON Transplant (MotherID);

-- Indexes for Daughter Table
CREATE INDEX idx_Daughter_MotherID ON Daughter (MotherID);
CREATE INDEX idx_Daughter_TransplantID ON Daughter (TransplantID);
CREATE INDEX idx_Daughter_GeneticMarkerID ON Daughter (GeneticMarkerID);
CREATE INDEX idx_Daughter_PhenotypicMarkerID ON Daughter (PhenotypicMarkerID);

-- Indexes for Strain Table
CREATE INDEX idx_Strain_DaughterID ON Strain (DaughterID);

-- Add more indexes as needed.

-- Create constraSMALLINTs, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constraSMALLINTs and indexes for the remaining tables in your schema.
