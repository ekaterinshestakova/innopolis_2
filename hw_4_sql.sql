-- список всех таблиц в базе данных
select *
from information_schema.tables;

select *
from information_schema.key_column_usage
     
-- список первичных ключей в каждой таблице базы
select kcu.table_schema,
       kcu.table_name,
       tco.constraint_name,
       tco.constraint_type,
       kcu.ordinal_position as position,
       kcu.column_name as key_column
from information_schema.table_constraints tco -- таблица с констрейнтами - правилами ограничения таблицы
join information_schema.key_column_usage kcu -- список полей с указанием на констрейнты
     on kcu.constraint_name = tco.constraint_name
     and kcu.constraint_schema = tco.constraint_schema
     and kcu.constraint_name = tco.constraint_name
where tco.constraint_type = 'PRIMARY KEY' -- тип констрейнта - первичный ключ
order by kcu.table_schema,
         kcu.table_name,
         position;
        
--table_schema - PK schema name
--table_name - PK table name
--constraint_name - PK constraint name
--position - index of column in table (1, 2, ...). 2 or higher means key is composite (contains more than one column)
--key_column - PK column name         

        
-- вывести всех неактивных покупателей
select *
from customer
where active = 0;
-- 15

--все фильмы, выпущенные в 2006 году
select film_id,
title
from film
where release_year = 2006;
-- 1000