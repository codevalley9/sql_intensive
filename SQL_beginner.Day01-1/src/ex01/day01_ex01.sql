SELECT  prs.name AS object_name
  FROM (SELECT name FROM person ORDER BY name) AS prs
 UNION ALL
SELECT mn.pizza_name AS object_name
  FROM (SELECT pizza_name FROM menu ORDER BY pizza_name) AS mn;