INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT row_number( ) over ( ) AS id, person_id, pizzeria_id,
       CASE WHEN COUNT(*) = 1 THEN 10.5
           WHEN COUNT(*) = 2 THEN 22
           --COUNT(*) используется для подсчета количества строк в результирующем наборе,
           -- сгруппированном по person_id и pizzeria_id
           ELSE 30
           END AS discount
  FROM person_order po
         JOIN menu m
         ON po.menu_id = m.id
 GROUP BY person_id, pizzeria_id;
