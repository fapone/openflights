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
