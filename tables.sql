-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    VendorName VARCHAR(150) UNIQUE NOT NULL
);

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Genus VARCHAR(100) NOT NULL,
    Species VARCHAR(100) UNIQUE NOT NULL
);

-- Create the Strain Table
-- NOT NULL
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
-- NOT NULL
CREATE TABLE StrainSeedBag (
    StrainSeedBagID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    StrainSeedBagName VARCHAR(150) NOT NULL,,
    PackageUnits INT NOT NULL,
    DateReceived DATE GETDATE() DEFAULT NOT NULL,
    StrainID INT NOT NULL,
    FOREIGN KEY (StrainID) REFERENCES Strain(StrainID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    StrainSeedBagID INT NOT NULL,
    FOREIGN KEY (StrainSeedBagID) REFERENCES StrainSeedBag(StrainSeedBagID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedID INT NOT NULL,
    DatePlanted DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedID INT NOT NULL,
    SproutDate DATE GETDATE() DEFAULT NOT NULL,
    HealthStatus BOOLEAN NOT NULL,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SeedlingID INT NOT NULL,
    DateMothered DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (SeedlingID) REFERENCES Seedling(SeedlingID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Maturity Table
CREATE TABLE Maturity (
    MaturityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MotherID INT NOT NULL,
    DateOfMaturityCheck DATE GETDATE() DEFAULT NOT NULL,
    Height INT NOT NULL,
    NumberOfBranches INT NOT NULL,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaturityID INT NOT NULL,
    CutDate DATE GETDATE() DEFAULT NOT NULL,
    NumberOfCuts SMALLINT NOT NULL,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CutID INT NOT NULL,
    TransplantDate DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TransplantID INT UNIQUE NOT NULL,
    Price SMALLINT NOT NULL,
    DateDaughtered DATE GETDATE() DEFAULT NOT NULL,
    HealthStatus BOOLEAN NOT NULL,
    Fate VARCHAR(50) NOT NULL, -- To track fate (e.g., 'Kept', 'Sold', 'Destroyed')
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID)
      ON UPDATE CASCADE ON DELETE CASCADE
);