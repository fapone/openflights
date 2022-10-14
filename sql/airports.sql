-- Create and load Airport database
DROP TABLE IF EXISTS "airports";
CREATE TABLE "airports" (
	"airport_id" nvarchar(100),  
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

ALTER TABLE airports 
ADD "id" int IDENTITY(1,1) PRIMARY KEY;