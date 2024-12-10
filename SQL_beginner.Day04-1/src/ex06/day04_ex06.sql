CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
  FROM menu AS m
         INNER JOIN pizzeria pz
         ON pz.id = m.pizzeria_id
         INNER JOIN person_visits pv
         ON m.pizzeria_id = pv.pizzeria_id
         INNER JOIN person p
         ON pv.person_id = p.id
WHERE p.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND price < 800;

-- SELECT * FROM mv_dmitriy_visits_and_eats