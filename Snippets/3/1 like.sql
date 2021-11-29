SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorState
FROM
	Vendors
WHERE VendorState LIKE 'N[A-J]';

SELECT
	VendorState
FROM
	Vendors
WHERE VendorState LIKE 'N[J-A]';

SELECT
	VendorState
FROM
	Vendors
WHERE VendorState LIKE 'N[^J-V]';

SELECT
	VendorZipCode
FROM
	Vendors
WHERE VendorZipCode NOT LIKE '[1-9]%';

SELECT
	VendorZipCode
FROM
	Vendors
WHERE VendorZipCode LIKE '0%';
