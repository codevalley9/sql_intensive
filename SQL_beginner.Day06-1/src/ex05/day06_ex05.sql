COMMENT ON COLUMN person_discounts.discount
IS 'Размер скидки. По умолчанию 0, не более 100';

COMMENT ON COLUMN person_discounts.person_id
IS 'Индификатор клиента';

COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'Индификатор пиццерии';

COMMENT ON COLUMN person_discounts.id
IS 'Идентификатор первичного ключа';

COMMENT ON TABLE person_discounts
IS 'В таблице указана персональная скидка для каждого клиента';