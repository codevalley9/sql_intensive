SELECT p.name AS person_name, m.pizza_name AS pizza_name, pz.name AS pizzeria_name
  FROM person_order po
      INNER JOIN person p ON p.id = po.person_id
      -- Присоединяем таблицу person по идентификатору person_id
      INNER JOIN menu m ON m.id = po.menu_id
      -- Присоединяем таблицу menu по идентификатору menu_id
      INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
      -- Присоединяем таблицу pizzeria по идентификатору pizzeria_id
 ORDER BY person_name, pizza_name, pizzeria_name