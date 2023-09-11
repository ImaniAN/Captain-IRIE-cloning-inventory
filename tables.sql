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

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT PRIMARY KEY,
    SeedID INT,
    DateTransplanted DATE,
    Age INT,
    Nodes INT,
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

-- Create primary key indexes and additional indexes as needed
-- (e.g., indexes for frequently queried columns, non-clustered indexes, etc.)
CREATE INDEX idx_Seed_BreederVendorID ON Seed (BreederVendorID);
CREATE INDEX idx_Seed_GeneticMarkerID ON Seed (GeneticMarkerID);
-- Add more indexes as needed.

-- Create constraints, triggers, and other database-specific configurations as required.
-- Ensure data types, default values, and cascading actions are appropriately defined.

-- Continue creating tables and defining constraints and indexes for the remaining tables in your schema.
