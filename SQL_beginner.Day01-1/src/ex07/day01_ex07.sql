SELECT po.order_date,
       CONCAT(p.name, ' (age:', p.age, ')') AS person_information --объединяем имя чел-а (p.name), возраст (p.age) в одну строку
  FROM person_order po -- Выбираем из таблицы person_order с псевдонимом po
         JOIN person p -- Присоединяем таблицу person с псевдонимом p
         ON po.person_id = p.id -- Устанавливаем связь между person_order.person_id и person.id
 ORDER BY order_date, person_information;