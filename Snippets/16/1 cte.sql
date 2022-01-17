SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	Summary1.VendorState,
	Summary1.VendorName,
	TopInState.SumOfInvoices
FROM
	(SELECT
		V_Sub.VendorState,
		V_Sub.VendorName,
		SUM(I_Sub.InvoiceTotal) AS SumOfInvoices
	FROM
		AP..Invoices AS I_Sub JOIN AP..Vendors AS V_Sub ON I_Sub.VendorID = V_Sub.VendorID
	GROUP BY V_Sub.VendorState, V_Sub.VendorName) AS Summary1 JOIN (
	SELECT
		Summary2.VendorState,
		MAX(Summary2.SumOfInvoices) AS SumOfInvoices
	FROM
		(SELECT
			V_Sub.VendorState,
			V_Sub.VendorName,
			SUM(I_Sub.InvoiceTotal) AS SumOfInvoices
		FROM
			AP..Invoices AS I_Sub JOIN AP..Vendors AS V_Sub ON I_Sub.VendorID = V_Sub.VendorID
		GROUP BY V_Sub.VendorState, V_Sub.VendorName) AS Summary2
	GROUP BY Summary2.VendorState) AS TopInState ON Summary1.VendorState = TopInState.VendorState AND Summary1.SumOfInvoices = TopInState.SumOfInvoices
ORDER BY Summary1.VendorState;

SELECT
	V_Sub.VendorState,
	V_Sub.VendorName,
	SUM(I_Sub.InvoiceTotal) AS SumOfInvoices
FROM
	AP..Invoices AS I_Sub JOIN AP..Vendors AS V_Sub ON I_Sub.VendorID = V_Sub.VendorID
GROUP BY V_Sub.VendorState, V_Sub.VendorName;

WITH
	Summary
	AS
	(
		SELECT
			VendorState,
			VendorName,
			SUM(InvoiceTotal) AS SumOfInvoices
		FROM
			AP..Invoices JOIN AP..Vendors ON Invoices.VendorID = Vendors.VendorID
		GROUP BY Vendors.VendorState, Vendors.VendorName
	),
	TopInState
	AS
	(
		SELECT
			VendorState,
			MAX(SumOfInvoices) AS SumOfInvoices
		FROM
			Summary
		GROUP BY VendorState
	)
SELECT
	Summary.VendorState,
	Summary.VendorName,
	TopInState.SumOfInvoices
FROM
	Summary JOIN TopInState ON Summary.VendorState = TopInState.VendorState AND Summary.SumOfInvoices = TopInState.SumOfInvoices
ORDER BY Summary.VendorState;
