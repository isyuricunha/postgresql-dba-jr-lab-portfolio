# m01 setup

## o que mudou
eu instalei postgresql 16 via pgdg, ativei logging_collector e ajustei log_line_prefix. eu organizei o pg_hba.conf para localhost e para a minha rede do lab com scram. eu modelei papéis de grupo sem login app_read e app_writer e apliquei default privileges no schema public. criei o usuário de administração do lab yuri_admin e o banco labdb.

## como mudou
eu usei alter system para ligar logs e recarreguei a config. eu editei o pg_hba.conf para permitir apenas localhost e minha faixa da rede do lab com scram. eu criei as roles de grupo sem login e concedi memberships ao yuri_admin. eu defini default privileges para que objetos novos já nasçam com leitura para app_read e dml para app_writer.

## por que mudou
eu preciso de logs previsíveis para troubleshooting e evidências. eu quero autenticação forte e acesso reduzido no pg_hba.conf. eu separo privilégios de identidades para reduzir risco e evitar esquecer grants a cada objeto novo.

## comandos principais que executei
```sql
-- papéis de grupo sem login
drop role if exists app_read;
drop role if exists app_writer;
create role app_read nologin;
create role app_writer nologin;

-- memberships
grant app_read to yuri_admin;
grant app_writer to yuri_admin;

-- privilégios padrão no schema public
revoke all on schema public from public;
grant usage on schema public to app_read;
grant usage, create on schema public to app_writer;

alter default privileges in schema public grant select on tables to app_read;
alter default privileges in schema public grant select, insert, update, delete on tables to app_writer;
alter default privileges in schema public grant usage on sequences to app_read;
alter default privileges in schema public grant usage, update on sequences to app_writer;
evidências incluídas
proofs/resultado_du_yuri_admin.txt

proofs/pg_hba.conf.extrato.txt

proofs/conexao_ok.png

proofs/conexao_negada.png

resultados
serviço ativo e acessível de forma segura. papéis e privilégios padrão funcionando. base labdb pronta para exercícios.

próximos passos
carregar pagila e iniciar explain analyze de cinco consultas antes e depois de criar índices b tree.
