
CREATE or ALTER PROCEDURE sp_load_bronze
AS
BEGIN
SET NOCOUNT ON;

DECLARE @starttime DATE;
DECLARE @endtime DATE;
DECLARE @TotalTimeSpent INT;

SET @starttime =GETDATE(); -- Get the starting time



PRINT '==== Begin Loading Data to bronze layer tables ===='

PRINT '==> Loading cust_info Data'
TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'F:\RT8U\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 

);

PRINT '=>Loading cust_info Data completed'

PRINT '==> Loading prd_info Data'
TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info
FROM 'F:\RT8U\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 

);
PRINT '=>Loading prd_info Data completed'

PRINT '==> Loading sales_details Data'
TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM 'F:\RT8U\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 

);
PRINT '=>Loading sales_details Data completed'

PRINT '==> Loading cust_az12 Data'
TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'F:\RT8U\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 

);
PRINT '=>Loading cust_az12 Data completed'

PRINT '==> Loading loc_a101 Data'
TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM 'F:\RT8U\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 

);
PRINT '=>Loading loc_a101 Data completed'

PRINT '==> Loading px_cat_g1v2 Data'
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'F:\RT8U\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 

);
PRINT '=>Loading px_cat_g1v2 Data completed'

PRINT '==== Loading Data to bronze layer completed ===='

SET @endtime =GETDATE();
SET @TotalTimeSpent = DATEDIFF(MINUTE,@starttime,@endtime)
PRINT 'Total Time spent to loda data is ' + cast(@TotalTimeSpent as nvarchar(2))+ ' Minutes'
END
