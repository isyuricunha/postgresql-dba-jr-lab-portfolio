# m02 sql e explain • relatório

eu medi cinco consultas no pagila com explain analyze. primeiro coletei o baseline sem novos índices e depois criei índices direcionados e medi de novo usando mediana de 5 rodadas.

## o que mudou
criei índices em film.rating, inventory.film_id, rental.rental_date, payment.payment_date, film_category.category_id e um índice de prefixo em film.title com text_pattern_ops.

## como mudou
rodei os scripts em lab/modules/m02-sql-explain/sql e capturei as saídas em proofs. gerei times_before e times_after por awk, e calculei medianas.

## por que mudou
eu queria números comparáveis antes e depois para evitar conclusões por cache.

## resultados principais
baseline exec time q1 37.740 ms e q5 0.255 ms  
após índices mediana q1 42.631 ms e q5 0.098 ms

leitura
q5 melhora clara graças ao índice com text_pattern_ops que atende like 'prefix%'.  
q1 não melhorou porque o custo de varrer inventory e agregar continua dominante neste dataset pequeno. manterei a versão original como referência. a reescrita por subconsulta agregando por film_id piorou no meu cenário e fica apenas como experimento.

## evidências
proofs
- queries_baseline_plans.txt
- queries_after_indexes_plans.txt
- times_after_indexes_median.txt
- queries_rewrite_plans.txt
- time_q1_rewrite.txt

## próximos passos
habilitar pg_stat_statements no m05 para observar consultas reais e usar tempos médios sob carga leve do pgbench. registrar ganhos ou regressões com cenários mais longos.
