SELECT tmp1.name, COALESCE(tmp1.count,0) + COALESCE(tmp2.count,0)AS count
FROM (SELECT pz.name, COUNT(*) AS "count"
FROM person_visits pv
    JOIN pizzeria pz
        ON pz.id = pv.pizzeria_id
GROUP BY pz.name) AS tmp1 FULL JOIN
    (SELECT pz.name, COUNT(*) AS "count"
     FROM person_order po
            INNER JOIN menu m
            ON po.menu_id = m.id
    INNER JOIN pizzeria pz on m.pizzeria_id = pz.id
    GROUP BY pz.name) AS tmp2 ON tmp1.name = tmp2.name
 ORDER BY count DESC, name ASC