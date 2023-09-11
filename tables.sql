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
    PackID VARCHAR(50),
    DateRecieved DATE,
    FOREIGN KEY (BreederVendorID) REFERENCES SeedBreederVendor(BreederVendorID),
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID),
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
);

-- Create the Seed Bank Table
CREATE TABLE SeedBank (
    SeedBankID INT PRIMARY KEY,
    SeedID INT,
    Quantity INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT PRIMARY KEY,
    SeedID INT,
    SeedBankID INT,
    DatePlanted DATE,
    Quantity INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID),
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID)
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT PRIMARY KEY,
    SeedID INT,
    DateTransplanted DATE,
    Age INT,
    PhenotypicMarkerID INT,
    GeneticMarkerID INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID),
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID),
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT PRIMARY KEY,
    SeedID INT,
    SeedlingID INT,
    SeedBankID INT,
    DatePlanted DATE,
    Age INT,
    TimeGrown INT,
    Nodes INT,
    PhenotypicMarkerID INT,
    GeneticMarkerID INT,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID),
    FOREIGN KEY (SeedlingID) REFERENCES Seedling(SeedlingID),
    FOREIGN KEY (SeedBankID) REFERENCES SeedBank(SeedBankID),
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID),
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID)
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
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT PRIMARY KEY,
    DateOfCut DATE,
    NumberOfBranchesCut INT,
    MotherID INT,
    TransplantID INT,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID),
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID)
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT PRIMARY KEY,
    CutID INT,
    MotherID INT,
    TransplantID INT,
    DateTransplanted DATE,
    GeneticMarkerID INT,
    PhenotypicMarkerID INT,
    Age INT,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID),
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID),
    FOREIGN KEY (GeneticMarkerID) REFERENCES GeneticMarker(GeneticMarkerID),
    FOREIGN KEY (PhenotypicMarkerID) REFERENCES PhenotypicMarker(PhenotypicMarkerID)
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT PRIMARY KEY,
    CutID INT,
    MotherID INT,
    NumberOfTransplants INT,
    DateTransplanted DATE,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID),
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
);


-- Create primary key indexes and additional indexes as needed
-- (e.g., indexes for frequently queried columns, non-clustered indexes, etc.)
CREATE INDEX idx_Seed_BreederVendorID ON Seed (BreederVendorID);
CREATE INDEX idx_Seed_GeneticMarkerID ON Seed (GeneticMarkerID);
-- Add more indexes as needed.

-- Create constraints, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constraints and indexes for the remaining tables in your schema.
