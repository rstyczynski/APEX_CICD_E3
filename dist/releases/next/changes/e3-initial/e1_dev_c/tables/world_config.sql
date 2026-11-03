-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841893 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/world_config.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/world_config.sql:null:74401c9d651336bf6004466919d3fabec625afd2:create

create table world_config (
    config_id        number,
    prefix           varchar2(30 char),
    default_entry_id number
);

alter table world_config add check ( config_id = 1 ) enable;

alter table world_config add primary key ( config_id )
    using index enable;

