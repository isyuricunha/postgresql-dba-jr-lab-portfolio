-- q1 rating + junção com inventory
create index if not exists ix_film_rating on film(rating);
create index if not exists ix_inventory_film_id on inventory(film_id);

-- q2 filtro por data em rental
create index if not exists ix_rental_rental_date on rental(rental_date);

-- q3 filtro por data em payment
create index if not exists ix_payment_payment_date on payment(payment_date);

-- q4 junção por categoria
create index if not exists ix_film_category_category on film_category(category_id);

-- q5 prefixo de título
-- text_pattern_ops ajuda o planner a usar o índice no like 'prefix%'
create index if not exists ix_film_title_prefix on film(title text_pattern_ops);
