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
SET PaymentDate = '2016-05-22', PaymentTotal = 19351.18
WHERE InvoiceNumber = '97/522';

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceNumber = '97/522';

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE VendorID = 95;

UPDATE AP..InvoiceCopy
SET TermsID = 1
WHERE VendorID = 95;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE VendorID = 95;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceNumber = '97/522';

UPDATE AP..InvoiceCopy
SET CreditTotal = CreditTotal + 100
WHERE InvoiceNumber = '97/522';

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceNumber = '97/522';

UPDATE AP..InvoiceCopy
SET CreditTotal += 100
WHERE InvoiceNumber = '97/522';

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceNumber = '97/522';
