SELECT person_id
  FROM person_order
 WHERE order_date = '2022-01-07' EXCEPT ALL --выполняет операцию разности между результатами этого запроса и следующего запроса
SELECT person_id
  FROM person_visits
 WHERE visit_date = '2022-01-07'