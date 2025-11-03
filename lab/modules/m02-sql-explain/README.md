# m02 sql e explain

## o que mudou
eu preparei um baseline de cinco consultas reais no pagila usando explain analyze. ainda não criei índices novos.

## como mudou
eu escrevi as consultas em `sql/queries_baseline.sql` e capturei a saída em `proofs/queries_baseline_plans.txt`.

## por que mudou
eu preciso de um ponto de comparação antes de criar índices para medir impacto real e não me enganar com cache.

## resultados parciais
baseline executado com sucesso. próximos passos criar índices direcionados e comparar planos e tempos.

## próximos passos
criar índices específicos para q1 a q5 e registrar `queries_after_indexes.sql` e a prova correspondente.

### atualização índices direcionados
eu criei índices específicos para as cinco consultas e rodei analyze. eu capturei os planos e gerei um resumo de tempos em `proofs/times_baseline.txt` e `proofs/times_after_indexes.txt`. objetivo: comparar antes e depois de forma objetiva.

### atualização q1 reescrita
eu reescrevi a q1 para agrupar por film_id primeiro e só depois juntar o título e filtrar por rating. objetivo: reduzir custo de agrupamento e nested loops.
