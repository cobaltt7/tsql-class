SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorName,
	CustLastName,
	CustFirstName,
	VendorState AS State,
	VendorCity AS City
FROM
	AP.dbo.Vendors AS Vendors
	JOIN ProductOrders.dbo.Customers AS Customers ON Vendors.VendorZipCode = Customers.CustZip
ORDER BY State, City;

SELECT
	VendorName,
	CustLastName,
	CustFirstName,
	VendorState AS State,
	VendorCity AS City
FROM
	Vendors
	JOIN ProductOrders..Customers AS Customers ON Vendors.VendorZipCode = Customers.CustZip
ORDER BY State, City;
