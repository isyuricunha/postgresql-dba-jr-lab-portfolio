-- comentários sempre em minúsculas

\echo q1_rewrite top 20 filmes mais alugados com filtro de rating (agrupando por id)
explain analyze
select f.title, t.rentals
from (
  select i.film_id, count(*) as rentals
  from rental r
  join inventory i on i.inventory_id = r.inventory_id
  group by i.film_id
) t
join film f on f.film_id = t.film_id
where f.rating = 'PG'
order by t.rentals desc
limit 20;
