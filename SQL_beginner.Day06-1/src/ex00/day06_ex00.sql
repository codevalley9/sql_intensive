DROP TABLE IF EXISTS person_discounts;

CREATE TABLE person_discounts
  (
    id bigint
      PRIMARY KEY,
    person_id bigint,
    pizzeria_id bigint,
    CONSTRAINT fk_person_discounts_person_id --ОГРАНИЧЕНИЕ
      FOREIGN KEY (person_id)
          REFERENCES person (id),
    CONSTRAINT fk_person_discounts_pizzeria_id
      FOREIGN KEY (pizzeria_id)
          REFERENCES pizzeria (id),
    discount numeric
  );