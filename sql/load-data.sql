-- Create and load Airlines database
DROP TABLE IF EXISTS "airlines";
CREATE TABLE "airlines" (
  "airline_id" int PRIMARY KEY,
  "name" varchar(255),
  "alias" varchar(255),
  "iata" varchar(225),
  "iacao" varchar(225),
  "callsign" varchar(255),
  "country" varchar(255),
  "active" varchar(255)
);

BULK INSERT airlines
FROM '/data/airlines.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK,
    FORMAT = 'CSV'
);

-- Create and load Airport database
DROP TABLE IF EXISTS "airports";
CREATE TABLE "airports" (
	"airport_id" int PRIMARY KEY,  
	"name" varchar(255),
	"city" varchar(255),
	"country" varchar(255),
	"iata" varchar(100),
	"icao" varchar(100),
	"latitude" float,
	"longitude" float,
	"altitude" int,
	"timezone" nvarchar(256),
	"dst" varchar(100) default NULL,
	"tz_id" varchar(100),
	"type" varchar(100),
	"source" varchar(100)
);

BULK INSERT airports
FROM '/data/airports.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK,
    FORMAT = 'CSV'
);

-- Create and load Route database
DROP TABLE IF EXISTS "routes";
CREATE TABLE "routes" (
	"airline" varchar(3) default NULL,
  	"airline_id" nvarchar(100) default NULL,
  	"src_ap" varchar(4) default NULL,
  	"src_apid" nvarchar(100) default NULL,
  	"dst_ap" varchar(4) default NULL,
  	"dst_apid" nvarchar(100) default NULL,
  	"codeshare" varchar(100),
  	"stops" varchar(100),
  	"equipment" varchar(100),
);

BULK INSERT routes
FROM '/data/routes.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK,
    FORMAT = 'CSV'
);

ALTER TABLE routes 
ADD "id" int IDENTITY(1,1) PRIMARY KEY;

-- Create and load Planes database
DROP TABLE IF EXISTS "planes";
CREATE TABLE "planes" (
  "name" varchar(255),
  "iata" varchar(3),
  "icao" varchar(4)
);

BULK INSERT planes
FROM '/data/planes.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK,
    FORMAT = 'CSV'
);
ALTER TABLE planes 
ADD "id" int IDENTITY(1,1) PRIMARY KEY;

-- Create and Countries Countries database
DROP TABLE IF EXISTS "countries";
CREATE TABLE "countries" (
	"name" varchar(255),
  	"iso_code" varchar(2) default NULL,
  	"dafif_code" varchar(100)
);

BULK INSERT countries
FROM '/data/countries.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK,
    FORMAT = 'CSV'
);

ALTER TABLE countries 
ADD "id" int IDENTITY(1,1) PRIMARY KEY