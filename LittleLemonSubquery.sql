SELECT Cuisines, Starters, Drinks, Desserts 
FROM menu 
WHERE MenuID = ANY (
  SELECT menuid 
  FROM orders 
  WHERE quantity > 2 
  GROUP BY menuid 
  HAVING COUNT(*) > 2
);