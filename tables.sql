-- Create a new database
CREATE DATABASE ProjectMotherShip;

-- Use the newly created database
USE ProjectMotherShip;

create table
  SeedBreederVendor (
    BreederVendorID bigint primary key generated always as identity,
    VendorName text not null unique
  );

-- Table Explanation: Stores genetic marker information.
create table
  GeneticMarker (
    GeneticMarkerID bigint primary key generated always as identity,
    Genus text not null,
    Species text not null unique
  );

-- Table Explanation: Represents different plant strains, linking them to vendors and genetic markers.
create table
  Strain (
    StrainID bigint primary key generated always as identity,
    NickName text,
    FirstName text,
    MiddleName text,
    LastName text,
    BreederVendorID bigint not null,
    GeneticMarkerID bigint not null, 
    foreign key (BreederVendorID) references SeedBreederVendor (BreederVendorID) on update cascade on delete cascade,
    foreign key (GeneticMarkerID) references GeneticMarker (GeneticMarkerID) on update cascade on delete cascade
  );

-- Table Explanation: Tracks seed bags for specific strains.
create table
  StrainSeedBag (
    StrainSeedBagID bigint primary key generated always as identity,
    StrainSeedBagName text not null,
    PackageUnits smallint not null,
    DateReceived timestamp with time zone default now() not null,
    StrainID bigint not null,
    foreign key (StrainID) references Strain (StrainID) on update cascade on delete cascade
  );

-- Table Explanation: Represents individual seeds and their association with seed bags.
create table
  Seed (
    SeedID bigint primary key generated always as identity,
    StrainSeedBagID bigint not null,
    foreign key (StrainSeedBagID) references StrainSeedBag (StrainSeedBagID) on update cascade on delete cascade
  );

-- Table Explanation: Records the planting of seeds.
create table
  Seeding (
    SeedingID bigint primary key generated always as identity,
    SeedID bigint not null,
    DatePlanted timestamp with time zone default now() not null,
    foreign key (SeedID) references Seed (SeedID) on update cascade on delete cascade
  );

-- Table Explanation: Tracks the growth of seedlings.
create table
  Seedling (
    SeedlingID bigint primary key generated always as identity,
    SeedID bigint not null,
    SproutDate timestamp with time zone default now() not null,
    foreign key (SeedID) references Seed (SeedID) on update cascade on delete cascade
  );

-- Table Explanation: Represents mature plants (mothers) obtained from seedlings.
create table
  Mothers (
    MotherID bigint primary key generated always as identity,
    SeedlingID bigint not null,
    DateMothered timestamp with time zone default now() not null,
    foreign key (SeedlingID) references Seedling (SeedlingID) on update cascade on delete cascade
  );

-- Table Explanation: Records information about the maturity of mother plants.
create table
  Maturity (
    MaturityID bigint primary key generated always as identity,
    MotherID bigint not null,
    DateOfMaturityCheck timestamp with time zone default now() not null,
    height smallint not null,
    NumberOfBranches int not null,
    foreign key (MotherID) references Mothers (MotherID) on update cascade on delete cascade
  );

-- Table Explanation: Tracks the cutting of mature plants.
create table
  Cutting (
    CutID bigint primary key generated always as identity,
    MaturityID bigint not null,
    CutDate timestamp with time zone default now() not null,
    NumberOfCuts smallint not null,
    foreign key (MaturityID) references Maturity (MaturityID) on update cascade on delete cascade
  );

-- Table Explanation: Records transplanting events.
create table
  Transplant (
    TransplantID bigint primary key generated always as identity,
    CutID bigint not null,
    TransplantDate timestamp with time zone default now() not null,
    foreign key (CutID) references Cutting (CutID) on update cascade on delete cascade
  );

-- Table Explanation: Represents daughter plants obtained from transplants and tracks their details.
create table
  Daughter (
    DaughterID bigint primary key generated always as identity,
    TransplantID bigint not null unique,
    Price smallint not null,
    DateDaughtered timestamp with time zone default now() not null,
    A1Healthy boolean not null,
    Fate text not null,
    foreign key (TransplantID) references Transplant (TransplantID) on update cascade on delete cascade
  );