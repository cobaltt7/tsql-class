SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE VendorID = (
	SELECT
	VendorID
FROM
	AP..VendorCopy
WHERE VendorName = 'Blue Cross'
);

DELETE AP..InvoiceCopy
WHERE VendorID = (
	SELECT
	VendorID
FROM
	AP..VendorCopy
WHERE VendorName = 'Blue Cross'
);

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE VendorID = (
	SELECT
	VendorID
FROM
	AP..VendorCopy
WHERE VendorName = 'Blue Cross'
);

DELETE AP..VendorCopy
FROM
	AP..InvoiceCopy JOIN AP..VendorCopy
	ON InvoiceCopy.VendorID = VendorCopy.VendorID
WHERE VendorName = 'Blue Cross';

SELECT
	*
FROM
	AP..VendorCopy
WHERE VendorID NOT IN (SELECT
	DISTINCT
	VendorID
FROM
	AP..InvoiceCopy);

DELETE AP..VendorCopy
WHERE VendorID NOT IN (SELECT
	DISTINCT
	VendorID
FROM
	AP..InvoiceCopy);

SELECT
	*
FROM
	AP..VendorCopy
WHERE VendorID NOT IN (SELECT
	DISTINCT
	VendorID
FROM
	AP..InvoiceCopy);

DELETE AP..VendorCopy
FROM
	AP..VendorCopy JOIN (
	SELECT
		VendorID,
		SUM(InvoiceTotal) AS TotalOfInvoices
	FROM
		AP..InvoiceCopy
	GROUP BY VendorID
) AS InvoiceSum
	ON VendorCopy.VendorID = InvoiceSum.VendorID
WHERE TotalOfInvoices <= 100;
