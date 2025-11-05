# formação dba postgresql júnior • lab de 8 semanas

eu criei este repositório para documentar meu estudo prático e comprovar, com evidências, que sei operar um postgresql de produção em nível júnior.

## objetivos do projeto

* executar backup lógico e restore testado, com rto e rpo definidos
* realizar pitr simples com wal archive
* manter um standby assíncrono e fazer failover manual
* investigar consultas com explain analyze e índices b-tree
* monitorar com pg_stat_statements e logs configurados
* fechar segurança básica com papéis, privilégios e pg_hba.conf organizado

## meu ambiente base

* ubuntu server 24.04 lts
* postgresql 16 via pgdg
* acesso remoto controlado pela minha rede tailscale

## hardware do lab de casa

* home lab 256gb ram ecc-r + 256gb ram ecc-r mirror (pra evitar falhas)
* 14tb hdd + 14tb hdd para redundancia + 14tb hdd pra backup
* 256gb nvme para o sistema
* 500gb nvme para cache de arquivos
* 4tb nvme para arquivos 'frios'
* gt 1050 gpu para video
* rx 7900 xtx gpu para ia's
* xeon w9 3475x cpu

## hardware arm64 do lab de casa

* raspberry pi 5 16gb
* soc broadcom bcm2712 quad-core arm cortex-a76
* ram 16 gb lpddr4x-4267
* 64gb emmc pra sistema
* 512gb pra containers e arquivos

## hardware de dev e prod em cloud

* epyc 7551 8vcpu
* 16gb ram
* 250gb
ps: sao duas maquinas/vms em cloud com o mesmo hardware

## arm64 - hardware de dev e prod em cloud

* cpu 8vcpu
* ram 24 gb
* 150gb pra tudo

## coisas para se ter em mente

* os ips nao sao reais, pode tentar invadir a vontade
* os usuarios e senhas nao sao reais, pode tentar invadir a vontade
* as bases de dados sao do `kiggle: https://www.kaggle.com/datasets`
* alguma coisas podem dar errado, e a ideia é aprender, entao, talvez eu force o erro
* nao tem uso de ia aqui

## padrões que eu sigo aqui

* comentários de código em minúsculas
* queries geralmente em minúsculas
* documentação em primeira pessoa, sempre explicando o que mudou, como mudou e por que mudou
* repositório público sob lgpl-2.1

## como reproduzir

1. preparar um ubuntu 24.04 com postgresql 16
2. seguir as instruções em `semanas/` na ordem, começando por `semanas/semana01`
3. usar os scripts em `scripts/` e configs de exemplo em `config/` quando eu adicionar nas próximas semanas

## metas rto e rpo alvo

* rto backup lógico até 15 minutos
* rpo backup lógico zero no horário do backup
* rto pitr até 20 minutos
* rpo pitr até 5 minutos com wal archive

## como eu documento mudanças

cada commit descreve:

* o que mudou
* como eu mudei
* por que eu mudei
* evidências adicionadas

exemplo de mensagem de commit:
`feat(semana01): criar papéis, ajustar pg_hba e registrar evidências • explico o porquê no readme da semana`

eu registro evidências em `evidencias/` e um resumo por semana em `semanas/<semana>/readme.md`.

## licença

este projeto está licenciado sob a lgpl-2.1. veja o arquivo `LICENSE`.
