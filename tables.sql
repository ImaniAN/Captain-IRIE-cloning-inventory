-- Create a new database
CREATE DATABASE YourDatabaseName;

-- Use the newly created database
USE YourDatabaseName;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID INT PRIMARY KEY,
    VendorName VARCHAR(255) UNIQUE
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID INT PRIMARY KEY,
    Genus VARCHAR(255),
    Species VARCHAR(255)
);

-- Create the Phenotypic Marker Table
CREATE TABLE PhenotypicMarker (
    PhenotypicMarkerID INT PRIMARY KEY,
    MarkerName VARCHAR(255) UNIQUE,
    Colour VARCHAR(255),
    LeafStructure VARCHAR(255)
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT PRIMARY KEY,
    BreederVendorID INT,
    GeneticMarkerID INT,
    PhenotypicMarkerID INT,
    PackID VARCHAR(50) DEFAULT 'HomePack', -- Set your default value here
    DateReceived DATE DEFAULT GETDATE(), -- Set your default value here
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
        ON UPDATE CASCADE ON DELETE CASCADE

-- Create the PackagingInfo Table
CREATE TABLE PackagingInfo (
    PackagingInfoID INT PRIMARY KEY,
    SeedID INT,
    SeedBankID INT,
    PackageUnits VARCHAR(50),
    PackagingDate DATE,
    ExpirationDate DATE,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seed Bank Table
CREATE TABLE SeedBank (
    SeedBankID INT PRIMARY KEY,
    SeedID INT,
    Quantity INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT PRIMARY KEY,
    SeedID INT,
    SeedBankID INT,
    DatePlanted DATE,
    Quantity INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT PRIMARY KEY,
    SeedID INT,
    SeedingID INT,
    SproutDate DATE,
    Age INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT PRIMARY KEY,
    SeedlingID INT,
    Age INT,
    TimeGrown INT,
    Nodes INT,
    PhenotypicMarkerID INT,
    GeneticMarkerID INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Maturity Table
CREATE TABLE Maturity (
    MaturityID INT PRIMARY KEY,
    MotherID INT,
    NumberOfBranches INT,
    BranchSites INT,
    Roots INT,
    Branches INT,
    Trunk INT,
    Nodes INT,
    Leaves INT,
    Color VARCHAR(255),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT PRIMARY KEY,
    DateOfCut DATE,
    NumberOfCuts INT,
    MaturityID INT,
    MotherID INT,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT PRIMARY KEY,
    CutID INT,
    MotherID INT,
    NumberOfTransplants INT,
    DateTransplanted DATE,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT PRIMARY KEY,
    CutID INT,
    MotherID INT,
    TransplantID INT,
    GeneticMarkerID INT,
    PhenotypicMarkerID INT,
    Age INT,
    NumberOfBranches INT,
    BranchSites INT,
    Roots INT,
    Branches INT,
    Trunk INT,
    Nodes INT,
    Leaves INT,
    Color VARCHAR(255),
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
    StrainID INT PRIMARY KEY,
    StrainName VARCHAR(255) UNIQUE,
    Age INT,
    DaughterID INT,
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

-- Create constraints, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constraints and indexes for the remaining tables in your schema.
