-- Creates a view combining relevant data from a cluster of interelated tables including: Products, Order Details, Orders, and Warehouses
-- The query displays data for all products carried by the Mint Classics Company regardless of corresponding data from Order Details, Orders, or Warehouses
-- This approach allows for the aggregation of data across multiple dimensions for assessing product profitability and warehousing storage dynamics
CREATE OR REPLACE VIEW products_cluster_view AS
SELECT p.productCode,
	   p.productName,
       p.productLine,
       p.quantityInStock,
       p.buyPrice,
       COALESCE(od.priceEach, 0) AS priceEach,
       COALESCE((od.priceEach - p.buyPrice), 0) AS profitPerItemOrder,
       COALESCE(od.quantityOrdered, 0) AS quantityOrdered,
       COALESCE(((od.priceEach - p.buyPrice) * od.quantityOrdered), 0) AS profitPerOrder,
       od.orderNumber,
       o.orderDate,
       o.shippedDate,
       o.status,
       w.warehouseCode, 
       w.warehouseName
FROM mintclassics.products p
LEFT JOIN mintclassics.orderdetails od ON p.productCode = od.productCode
LEFT JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber
LEFT JOIN mintclassics.warehouses w ON p.warehouseCode = w.warehouseCode;