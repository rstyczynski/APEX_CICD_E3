-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841697 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/hello_config.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/hello_config.sql:null:3678cab1eff621eab20f7af9919835fd1e309fa2:create

create table hello_config (
    config_id        number,
    prefix           varchar2(30 char),
    default_entry_id number
);

alter table hello_config add check ( config_id = 1 ) enable;

alter table hello_config add primary key ( config_id )
    using index enable;

