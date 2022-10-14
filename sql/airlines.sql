-- Create and load Airlines database
DROP TABLE IF EXISTS "airlines";
CREATE TABLE "airlines" (
  "airline_id" nvarchar(100),
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

ALTER TABLE airlines 
ADD "id" int IDENTITY(1,1) PRIMARY KEY;