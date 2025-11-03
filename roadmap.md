Perfeito. Aqui está teu plano fechado de 8 semanas focado em te colocar como Júnior forte em produção, com entregáveis de portfólio, metas RTO e RPO, logs e EXPLAIN documentados.

# Visão geral do laboratório

Primário em Ubuntu 24.04 com PostgreSQL 16 via PGDG instalado no sistema
Standby simples em VM ou container
Armazenamento para backups em disco separado
Banco de testes Pagila e pgbench para carga

Sugestão de rotina
Estudo 90 a 120 minutos por dia, 5 dias por semana
Laboratórios aos sábados para consolidar e gerar evidências

# Entregáveis do portfólio ao final

Runbook de backup e restore com RTO e RPO medidos
Procedimento de replicação e failover manual com evidências
Dossiê de EXPLAIN ANALYZE de 5 consultas com melhorias claras
Checklist operacional diária e semanal
Relatório de monitoração básica com snapshots das visões do sistema

# Semana 1 Fundamentos e setup

Objetivo
Instalar PostgreSQL 16 via PGDG no Ubuntu. Dominar psql básico, roles, permissões e pg_hba.conf.
Meta de saída
Conectar local e remoto com segurança, criar usuários e bancos, e operar o serviço.

Tarefas
Instalação via repositório PGDG
Configurar locale, timezone, diretórios e permissões
Criar roles de aplicação, leitura e administração
Ajustar pg_hba.conf para acesso apenas da tua rede
Revisar ACID e MVCC em nível prático com transações simples

Evidências para portfólio
Arquivo de configuração redigido e comentado
Script de bootstrap SQL para criar roles e bancos
Prints de conexões psql com e sem senha e o motivo da falha controlada

Checklist rápida
Consigo iniciar, parar e checar o serviço
Consigo criar role com login, senha e privilégio mínimo
pg_hba.conf com CIDR correto e método scram

# Semana 2 SQL sólido e EXPLAIN básico

Objetivo
Conseguir ler e melhorar consultas comuns.
Meta de saída
Usar EXPLAIN e EXPLAIN ANALYZE, identificar varredura sequencial versus índice.

Tarefas
Carregar o banco Pagila
Criar índices B Tree sobre colunas mais filtradas
Rodar EXPLAIN ANALYZE em 5 consultas e registrar tempo, rows e custo
Aplicar LIMIT, filtros por igualdade e intervalo e comparar planos

Evidências
Caderno SQL com as 5 consultas, plano antes e depois, e justificativa do índice
Tabela de resultados com tempo e contagem de linhas

Checklist
Sei interpretar Seq Scan, Index Scan, Index Only Scan e Nested Loop
Sei quando criar ou não um índice

# Semana 3 Backup lógico e restore testado

Objetivo
Ter rotina confiável com pg_dump e pg_restore e que prova que funciona.
Metas RTO e RPO iniciais
RTO alvo até 15 minutos para um banco pequeno de testes
RPO zero para backups lógicos diários

Tarefas
Criar script de backup lógico com carimbo de data
Automatizar compressão e retenção simples
Criar banco de restauração e validar integridade
Cron diário no ambiente de laboratório

Evidências
Script de backup lógico e log de execução
Vídeo curto ou prints mostrando o restore e a aplicação funcionando
Medição de RTO real do restore em laboratório e registro do tempo

Checklist
Backup roda sozinho e envia log para arquivo
Restore repetível com um único comando

# Semana 4 Backup físico e PITR simples

Objetivo
Habilitar WAL archive e executar um Point In Time Recovery após erro simulado.
Metas
RPO 5 minutos usando WAL archive
RTO até 20 minutos para recuperar ponto no tempo

Tarefas
Ativar archive_mode e archive_command
Gerar backup base com pg_basebackup
Simular deleção acidental e executar PITR até um timestamp logo antes
Documentar restore_command e timeline

Evidências
Runbook de PITR com passos, arquivos usados e horário
Log com tempo total de recuperação
Comando psql mostrando a volta dos dados

Checklist
Sei identificar o LSN, timeline e usar recovery parameters
Consigo provar que voltei no tempo correto

# Semana 5 Monitoração e logs para troubleshooting

Objetivo
Enxergar o que o banco está fazendo e capturar SQL problemático.
Meta de saída
Saber usar pg_stat_activity, pg_stat_statements e auto_explain.

Tarefas
Ajustar logging_collector, log_line_prefix e nível de log adequado
Instalar e habilitar pg_stat_statements
Instalar auto_explain e registrar planos lentos acima de certo tempo
Criar consultas de saúde: conexões, locks, tempo médio, top n por tempo

Evidências
Relatório com prints das visões e explicação do que cada métrica indica
Lista de 10 consultas úteis para rotina de plantão
Exemplos de entradas de log e interpretação

Checklist
Sei descobrir a query mais lenta do período
Sei identificar bloqueios e quem bloqueia quem

# Semana 6 Replicação e failover manual

Objetivo
Manter um standby assíncrono e saber promover manualmente.
Metas
Standby aplicando WAL continuamente
Failover manual com tempo de indisponibilidade controlado

Tarefas
Configurar replication user e parâmetros no primário
Criar o standby com base backup
Testar corte do primário e promover o standby
Reanexar o antigo primário com pg_rewind

Evidências
Procedimento passo a passo com comandos e tempos
Print do status do replication e da promoção
Vídeo curto ou prints mostrando reconexão com pg_rewind

Checklist
Sei checar atraso do standby
Sei promover e reanexar sem rebuild total

# Semana 7 Performance do dia a dia

Objetivo
Ganhar sensibilidade para autovacuum, estatísticas e parâmetros essenciais.
Metas
Reduzir tempo de uma consulta alvo em pelo menos 30 por cento
Manter bloat controlado e estatísticas atualizadas

Tarefas
Rodar pgbench para gerar carga
Medir e ajustar work_mem, maintenance_work_mem, effective_cache_size e checkpoint settings de forma conservadora
Forçar e medir impacto de ANALYZE e VACUUM
Medir bloat com consultas conhecidas e propor manutenção

Evidências
Tabela antes e depois com tempos das consultas e valores dos parâmetros
Checklist de tuning seguro para ambiente Júnior
Script SQL de diagnóstico rápido

Checklist
Sei quando ajustar work_mem por sessão
Sei ler estatísticas de autovacuum e detectar bloat

# Semana 8 Segurança e operações

Objetivo
Fechar ambiente básico de produção.
Metas
Mínimo privilégio aplicado
Conexões criptografadas e rotina operacional definida

Tarefas
Modelar papéis com privilégio mínimo
Organizar pg_hba.conf por rede, usuário e método
Habilitar SSL com certificado autoassinado para laboratório
Fechar checklist diária, semanal e mensal

Evidências
Matriz de papéis e privilégios
pg_hba.conf final comentado
Checklist operacional final
Relatório final do projeto com links para as evidências anteriores

Checklist
Usuários de aplicação não têm superuser, createdb ou createrole
Conexão remota exige criptografia e usuário correto

# Materiais prontos para você colar no teu lab

Comando para instalar o Pagila
psql -U postgres -h localhost -f pagila-schema.sql
psql -U postgres -h localhost -f pagila-data.sql

Modelo de script de backup lógico diário

```bash
#!/usr/bin/env bash
set -euo pipefail
DATA=$(date +%F_%H-%M)
DEST="/var/backups/pg/logic"
DB="minhaapp"
mkdir -p "$DEST"
pg_dump -U postgres -h 127.0.0.1 -F c -j 4 -f "$DEST/${DB}_${DATA}.dump" "$DB" 2> "$DEST/${DB}_${DATA}.log"
find "$DEST" -type f -name "*.dump" -mtime +7 -delete
```

Modelo de coleta de top consultas

```sql
select query, calls, total_exec_time, mean_exec_time
from pg_stat_statements
order by total_exec_time desc
limit 10;
```

Modelo de EXPLAIN para portfólio

```sql
explain analyze
select f.title, count(*) rentals
from film f
join inventory i on i.film_id = f.film_id
join rental r on r.inventory_id = i.inventory_id
where f.rating = 'PG'
group by f.title
order by rentals desc
limit 20;
```

Modelo de metas RTO e RPO para anexar ao runbook
RTO alvo
Backup lógico restore completo em até 15 minutos com base de até 5 GB
PITR em até 20 minutos

RPO alvo
Backup lógico diário com RPO zero no horário do backup
PITR com RPO de até 5 minutos usando arquivo de WAL

# Como usar este plano

Siga semana por semana sem pular. Gere evidências todas as semanas. Ao final da Semana 4 e da Semana 8 publique um pacote zip com scripts, prints, logs e um README explicando como reproduzir. Isso vira teu portfólio de Júnior pronto.