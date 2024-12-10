DROP FUNCTION fnc_fibonacci;
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
    RETURNS table
            (
                a bigint
            )
AS
$$
WITH RECURSIVE t(a,b) AS (
        VALUES(0,1)
    UNION ALL
        SELECT b, a + b FROM t
        WHERE b < pstop
   )
SELECT a FROM t;
$$
    LANGUAGE SQL;

select * from fnc_fibonacci(20);
select * from fnc_fibonacci();
