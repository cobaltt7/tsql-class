SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceNumber = '97/522';

UPDATE AP..InvoiceCopy
SET CreditTotal += 100,
InvoiceDueDate = (SELECT
	MAX(InvoiceDueDate)
FROM
	AP..InvoiceCopy)
WHERE InvoiceNumber = '97/522';

UPDATE AP..InvoiceCopy
SET CreditTotal += 100,
InvoiceDueDate = (SELECT
	MAX(InvoiceDueDate) AS InvoiceDueDateMax
FROM
	AP..InvoiceCopy)
WHERE InvoiceNumber = '97/522';

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceNumber = '97/522';

SELECT
	MAX(InvoiceDueDate)
FROM
	AP..InvoiceCopy;

UPDATE AP..InvoiceCopy
SET TermsID = 1
WHERE VendorID = (SELECT
	VendorID
FROM
	AP..Vendors
WHERE VendorName = 'Pacific Bell');

UPDATE AP..InvoiceCopy
SET TermsID = 1
WHERE VendorID IN (SELECT
	VendorID
FROM
	AP..Vendors
WHERE VendorState IN ('CA', 'AZ', 'NV'));
