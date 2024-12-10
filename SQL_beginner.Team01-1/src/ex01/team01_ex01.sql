SELECT t.name, t.lastname, currency_name, money * rate_to_usd AS curency_in_usd
FROM (
     SELECT COALESCE(u.name, 'not defined') AS name,
         COALESCE(u.lastname, 'not defined') AS lastname,
            c.name AS currency_name,
            money,
            COALESCE ((SELECT rate_to_usd
                FROM currency c
                WHERE b.currency_id = c.id
                AND c.updated < b.updated
                ORDER BY c.updated DESC limit 1),
                (SELECT rate_to_usd
                FROM currency c
                WHERE b.currency_id = c.id
                AND c.updated > b.updated
                ORDER BY c.updated ASC limit 1)
                ) AS rate_to_usd
    FROM balance b
    INNER JOIN (
        SELECT c.id, c.name FROM currency c
        GROUP BY c.id, c.name
        ) AS c ON c.id = b.currency_id
    LEFT JOIN "user" u ON u.id = b.user_id) AS t
ORDER BY 1 DESC, 2, 3;