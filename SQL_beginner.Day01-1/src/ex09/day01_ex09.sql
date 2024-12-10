SELECT name
  FROM pizzeria
 WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);
--В операторе IN, мы сравниваем значение с набором значений или подзапросом

SELECT name
  FROM pizzeria p
 WHERE NOT EXISTS(SELECT 1 FROM person_visits WHERE pizzeria_id = p.id)
--В операторе EXISTS, подзапрос возвращает TRUE или FALSE в зависимости от того,
-- существуют ли записи, удовлетворяющие условию подзапроса.