# Script to initialize the DWH DB with required schemas


USE master
GO

-- Drop and Recreate the 'DWH' DB if already exists
IF EXISTS (SELECT 1 FROM SYS.DATABASES WHERE name='DWH')
BEGIN
ALTER DATABASE DWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE DWH
END

-- Create the 'DWH' DB
CREATE DATABASE DWH
GO

-- Create Schemas
USE DWH
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
