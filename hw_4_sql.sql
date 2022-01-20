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