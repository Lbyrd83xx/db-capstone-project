SELECT c.customerid, fullname, o.orderid, o.TotalCost, m.cuisines, m.starters, m.drinks, m.desserts
FROM customerdetails c
INNER JOIN orders o ON c.customerid = o.CustomerDetails_CustomerID
INNER JOIN menu m ON o.Menu_MenuID = m.menuid
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;