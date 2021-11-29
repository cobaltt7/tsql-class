SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ')
GROUP BY VendorState, VendorCity
ORDER BY VendorState DESC, VendorCity DESC;

SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ')
GROUP BY VendorState, VendorCity WITH CUBE
ORDER BY VendorState DESC, VendorCity DESC;

SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ')
GROUP BY CUBE(VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

SELECT
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ');
