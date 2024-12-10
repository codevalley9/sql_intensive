SET enable_seqscan = OFF; --отключаем последовательное сканирование таблицы
EXPLAIN ANALYZE--анализ и вывод информации
SELECT pizza_name, name AS pizzeria_name
  FROM menu
         JOIN pizzeria p
         ON menu.pizzeria_id = p.id