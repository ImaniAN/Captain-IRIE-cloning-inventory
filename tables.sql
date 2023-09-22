-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

-- Create the Seed Breeder Vendor Table
CREATE TABLE SeedBreederVendor (
    BreederVendorID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    VendorName VARCHAR(150) UNIQUE NOT NULL
);
-- Table Explanation: Stores information about seed breeder vendors.

-- Create the Genetic Marker Table
CREATE TABLE GeneticMarker (
    GeneticMarkerID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Genus VARCHAR(100) NOT NULL,
    Species VARCHAR(100) UNIQUE NOT NULL
);
-- Table Explanation: Stores genetic marker information.

-- Create the Strain Table
CREATE TABLE Strain (
    StrainID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
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
-- Table Explanation: Represents different plant strains, linking them to vendors and genetic markers.

-- Create the StrainSeedBag Table
CREATE TABLE StrainSeedBag (
    StrainSeedBagID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    StrainSeedBagName VARCHAR(150) NOT NULL,
    PackageUnits INT NOT NULL,
    DateReceived DATE GETDATE() DEFAULT NOT NULL,
    StrainID INT NOT NULL,
    FOREIGN KEY (StrainID) REFERENCES Strain(StrainID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Tracks seed bags for specific strains.

-- Create the Seed Table
CREATE TABLE Seed (
    SeedID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    StrainSeedBagID INT NOT NULL,
    FOREIGN KEY (StrainSeedBagID) REFERENCES StrainSeedBag(StrainSeedBagID)
        ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Represents individual seeds and their association with seed bags.

-- Create the Seeding Table
CREATE TABLE Seeding (
    SeedingID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SeedID INT NOT NULL,
    DatePlanted DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Records the planting of seeds.

-- Create the Seedling Table
CREATE TABLE Seedling (
    SeedlingID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SeedID INT NOT NULL,
    SproutDate DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (SeedID) REFERENCES Seed(SeedID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Tracks the growth of seedlings.

-- Create the Mothers Table
CREATE TABLE Mothers (
    MotherID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SeedlingID INT NOT NULL,
    DateMothered DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (SeedlingID) REFERENCES Seedling(SeedlingID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Represents mature plants (mothers) obtained from seedlings.

-- Create the Maturity Table
CREATE TABLE Maturity (
    MaturityID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    MotherID INT NOT NULL,
    DateOfMaturityCheck DATE GETDATE() DEFAULT NOT NULL,
    Height INT NOT NULL,
    NumberOfBranches INT NOT NULL,
    FOREIGN KEY (MotherID) REFERENCES Mothers(MotherID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Records information about the maturity of mother plants.

-- Create the Cutting Table
CREATE TABLE Cutting (
    CutID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    MaturityID INT NOT NULL,
    CutDate DATE GETDATE() DEFAULT NOT NULL,
    NumberOfCuts SMALLINT NOT NULL,
    FOREIGN KEY (MaturityID) REFERENCES Maturity(MaturityID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Tracks the cutting of mature plants.

-- Create the Transplant Table
CREATE TABLE Transplant (
    TransplantID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    CutID INT NOT NULL,
    TransplantDate DATE GETDATE() DEFAULT NOT NULL,
    FOREIGN KEY (CutID) REFERENCES Cutting(CutID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Records transplanting events.

-- Create the Daughter Table
CREATE TABLE Daughter (
    DaughterID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TransplantID INT UNIQUE NOT NULL,
    Price SMALLINT NOT NULL,
    DateDaughtered DATE GETDATE() DEFAULT NOT NULL,
    HealthStatus BOOLEAN NOT NULL,
    Fate VARCHAR(50) NOT NULL, -- To track fate (e.g., 'Kept', 'Sold', 'Destroyed')
    FOREIGN KEY (TransplantID) REFERENCES Transplant(TransplantID)
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- Table Explanation: Represents daughter plants obtained from transplants and tracks their details.