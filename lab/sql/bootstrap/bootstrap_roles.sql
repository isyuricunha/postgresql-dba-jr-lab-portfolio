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
