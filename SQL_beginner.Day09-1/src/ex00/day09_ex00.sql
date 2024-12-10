DROP TABLE IF EXISTS person_audit;
create
table person_audit
(
created timestamptz(0) not null default (current_timestamp),
type_event char(1) not null default ('i'),
row_id bigint not null,
name varchar,
age integer,
gender varchar,
address varchar
);
alter table person_audit
    add constraint ch_type_event check (type_event in ('I', 'U', 'D'));

create
or replace function fnc_trg_person_insert_audit()
returns trigger as $trg_person_insert_audit$
begin
    if (tg_op = 'INSERT') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'I', new.*;
    end if;
    return null;
end;
$trg_person_insert_audit$ language plpgsql;

create trigger trg_person_insert_audit
    after insert
    on person
    for each row
    execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address) values (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;