-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841857 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/lab_state.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/lab_state.sql:null:ec658061d5670fe1e1b13d7aa9124f14ba8c6a38:create

create table lab_state (
    state_key  varchar2(30 byte),
    parent_key varchar2(30 byte),
    state      varchar2(20 byte),
    reason     varchar2(1000 byte)
);

alter table lab_state
    add
        check ( state in ( 'ready', 'maintenance', 'failed' ) ) enable;

alter table lab_state add primary key ( state_key )
    using index enable;

