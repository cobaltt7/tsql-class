SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;
SELECT
	*
FROM
	AP..InvoiceCopy JOIN AP..Vendors
	ON InvoiceCopy.VendorID = Vendors.VendorID
WHERE VendorName = 'Pacific Bell';

UPDATE AP..InvoiceCopy
SET TermsID = 1
FROM
	AP..InvoiceCopy JOIN AP..Vendors
	ON InvoiceCopy.VendorID = Vendors.VendorID
WHERE VendorName = 'Pacific Bell';

SELECT
	*
FROM
	AP..InvoiceCopy JOIN AP..Vendors
	ON InvoiceCopy.VendorID = Vendors.VendorID
WHERE VendorName = 'Pacific Bell';
