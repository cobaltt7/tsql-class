SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorName,
	VendorContactLName + ', ' + LEFT(VendorContactFName, 1) + '.' AS ContactName,
	RIGHT(VendorPhone, 8) AS Phone
FROM
	AP..Vendors
WHERE SUBSTRING(VendorPhone, 2, 3) = 559
ORDER BY VendorName;

SELECT
	*
FROM
	Examples..StringSample
ORDER BY ID;

SELECT
	*
FROM
	Examples..StringSample
ORDER BY CAST(ID AS INT);

SELECT
	Name,
	CHARINDEX(' ', Name) AS CharIndex,
	LEFT(Name, CHARINDEX(' ', Name) - 1) AS First,
	RIGHT(Name, LEN(Name) - CHARINDEX(' ', Name) ) AS Last
FROM
	Examples..StringSample;
