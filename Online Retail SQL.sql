SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalOrderValue
FROM OnlineRetail
GROUP BY CustomerID
ORDER BY TotalOrderValue DESC;


SELECT CustomerID, COUNT(DISTINCT StockCode) AS UniqueProductsPurchased
FROM OnlineRetail
GROUP BY CustomerID
ORDER BY UniqueProductsPurchased DESC


SELECT CustomerID, COUNT(DISTINCT InvoiceDate) AS NumberOfPurchases
FROM OnlineRetail
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceDate) = 1


SELECT t1.StockCode AS Product1, t2.StockCode AS Product2, COUNT(*) AS PurchaseCount
FROM OnlineRetail t1
JOIN OnlineRetail t2 
ON t1.InvoiceDate = t2.InvoiceDate 
AND t1.CustomerID = t2.CustomerID 
AND t1.StockCode < t2.StockCode
GROUP BY t1.StockCode, t2.StockCode
ORDER BY PurchaseCount DESC
