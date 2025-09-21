USE DWH
GO
-- ## Drop and recreate the bronze layer CRM specific tables

-- bronze.crm_cust_info
  
IF EXISTS ( SELECT 1 FROM sys.schemas sc join Sys.tables st ON sc.schema_id=st.schema_id
WHERE sc.name+'.'+st.name ='bronze.crm_cust_info')
BEGIN
	DROP TABLE bronze.crm_cust_info
END

CREATE TABLE bronze.crm_cust_info
(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastnmae NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);


--bronze.crm_prd_info

IF EXISTS ( SELECT 1 FROM sys.schemas sc join Sys.tables st ON sc.schema_id=st.schema_id
WHERE sc.name+'.'+st.name ='bronze.crm_prd_info')
BEGIN

	DROP TABLE bronze.crm_prd_info
END

CREATE TABLE bronze.crm_prd_info
(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);


--bronze.crm_sales_details

IF EXISTS ( SELECT 1 FROM sys.schemas sc join Sys.tables st ON sc.schema_id=st.schema_id
WHERE sc.name+'.'+st.name ='bronze.crm_sales_details')
BEGIN

	DROP TABLE bronze.crm_sales_details
END

CREATE TABLE bronze.crm_sales_details
(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);


-- ## Drop and recreate the bronze layer ERP specific tables

-- bronze.erp_cust_az12

IF EXISTS ( SELECT 1 FROM sys.schemas sc join Sys.tables st ON sc.schema_id=st.schema_id
WHERE sc.name+'.'+st.name ='bronze.erp_cust_az12')
BEGIN

	DROP TABLE bronze.erp_cust_az12
END

CREATE TABLE bronze.erp_cust_az12
(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);

-- bronze.erp_loc_a101

IF EXISTS ( SELECT 1 FROM sys.schemas sc join Sys.tables st ON sc.schema_id=st.schema_id
WHERE sc.name+'.'+st.name ='bronze.erp_loc_a101')
BEGIN

	DROP TABLE bronze.erp_loc_a101
END

CREATE TABLE bronze.erp_loc_a101
(
	cid NVARCHAR(50),
	cntry  NVARCHAR(50)
);

--bronze.erp_px_cat_g1v2

IF EXISTS ( SELECT 1 FROM sys.schemas sc join Sys.tables st ON sc.schema_id=st.schema_id
WHERE sc.name+'.'+st.name ='bronze.erp_px_cat_g1v2')
BEGIN
	DROP TABLE bronze.erp_px_cat_g1v2
END

CREATE TABLE bronze.erp_px_cat_g1v2
(
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50),
);
