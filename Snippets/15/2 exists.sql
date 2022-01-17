SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorID,
	VendorName,
	VendorState
FROM
	AP..Vendors
WHERE NOT EXISTS (
	SELECT
	*
FROM
	AP..Invoices
WHERE Invoices.VendorID = Vendors.VendorID
);

SELECT
	VendorID,
	VendorName,
	VendorState
FROM
	AP..Vendors
WHERE EXISTS (
	SELECT
	*
FROM
	AP..Invoices
WHERE Invoices.VendorID = Vendors.VendorID
);
