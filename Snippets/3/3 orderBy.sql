SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorName,
	VendorCity + ', ' + VendorState + ', ' + VendorZipCode AS VendorAddress
FROM
	Vendors
ORDER BY VendorName;

SELECT
	VendorName,
	VendorCity + ', ' + VendorState + ', ' + VendorZipCode AS VendorAddress
FROM
	Vendors
ORDER BY VendorName DESC;

SELECT
	VendorName,
	VendorCity + ', ' + VendorState + ', ' + VendorZipCode AS VendorAddress
FROM
	Vendors
ORDER BY VendorState, VendorCity, VendorName;

SELECT
	VendorName,
	VendorCity + ', ' + VendorState + ', ' + VendorZipCode AS VendorAddress
FROM
	Vendors
ORDER BY VendorAddress, VendorName;

SELECT
	VendorName,
	VendorContactFName + ' ' + VendorContactLName AS Name
FROM
	Vendors
ORDER BY VendorContactLName + ', ' + VendorContactFName;

SELECT
	VendorName,
	VendorContactFName + ' ' + VendorContactLName AS Name
FROM
	Vendors
ORDER BY 2, 1;
