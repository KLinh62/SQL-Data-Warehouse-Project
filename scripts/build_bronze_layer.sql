-- Check if the tables already exist in the database. If already exist, drop and recreate the tables
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(10),
	cst_gndr NVARCHAR(10),
	cst_create_date DATE
);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(10),
	prd_start_dt DATE,
	prd_end_dt DATE
);

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
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

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(10)
);

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	category NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(10)
);
/*
===
Making the table empty then perform bulk insert. Turn it into a Stored Procedure.
===
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	TRUNCATE TABLE bronze.crm_cust_info;
	BULK INSERT bronze.crm_cust_info
	FROM 'D:\KHANH LINH\DATA ANALYSIS LEARNING\Portfolio projects\Data with Baraa\1_Data Warehousing\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2, -- Specify that the data starts at 2nd row, skip the 1st row as it is header which we have defined
		FIELDTERMINATOR = ',', -- Delimiter between fields
		TABLOCK -- Optional: lock the entire table during loading
	);

	TRUNCATE TABLE bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'D:\KHANH LINH\DATA ANALYSIS LEARNING\Portfolio projects\Data with Baraa\1_Data Warehousing\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'D:\KHANH LINH\DATA ANALYSIS LEARNING\Portfolio projects\Data with Baraa\1_Data Warehousing\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2, 
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);

	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'D:\KHANH LINH\DATA ANALYSIS LEARNING\Portfolio projects\Data with Baraa\1_Data Warehousing\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE bronze.erp_loc_a101;
	BULK INSERT bronze.erp_loc_a101
	FROM 'D:\KHANH LINH\DATA ANALYSIS LEARNING\Portfolio projects\Data with Baraa\1_Data Warehousing\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);

	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'D:\KHANH LINH\DATA ANALYSIS LEARNING\Portfolio projects\Data with Baraa\1_Data Warehousing\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);
END
