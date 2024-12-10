DROP INDEX IF EXISTS idx_person_discounts_unique;

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
SET enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT person_id, discount
  FROM person_discounts
 WHERE pizzeria_id = 6;