-- habilitar analyze nos planos
-- comentários sempre em minúsculas

\echo q1 top 20 filmes mais alugados com filtro de rating
explain analyze
select f.title, count(*) as rentals
from film f
join inventory i on i.film_id = f.film_id
join rental r on r.inventory_id = i.inventory_id
where f.rating = 'PG'
group by f.title
order by rentals desc
limit 20;

\echo q2 alugueis por cliente em uma janela de datas
explain analyze
select r.customer_id, count(*) as rentals
from rental r
where r.rental_date >= date '2005-05-01'
  and r.rental_date <  date '2005-06-01'
group by r.customer_id
order by rentals desc
limit 20;

\echo q3 total pago por cliente em uma janela de datas
explain analyze
select p.customer_id, sum(p.amount) as total_pago
from payment p
where p.payment_date >= timestamp '2005-05-01'
  and p.payment_date <  timestamp '2005-06-01'
group by p.customer_id
order by total_pago desc
limit 20;

\echo q4 contagem de filmes por categoria
explain analyze
select c.name, count(*) as qtd
from category c
join film_category fc on fc.category_id = c.category_id
group by c.name
order by qtd desc;

\echo q5 busca por prefixo no título
explain analyze
select film_id, title
from film
where title like 'ACADEMY%'
order by title;
