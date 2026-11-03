-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841930 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/world_entries.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/world_entries.sql:null:d2c7e6cf6c40e2a4e502aae7867f28749fd26b12:create

create table world_entries (
    entry_id   number generated always as identity not null enable,
    entry_text varchar2(100 char) not null enable,
    active     char(1 byte) default 'Y' not null enable
);

alter table world_entries
    add
        check ( active in ( 'Y', 'N' ) ) enable;

alter table world_entries
    add constraint world_text_valid
        check ( length(trim(entry_text)) between 1 and 100 ) enable;

alter table world_entries add primary key ( entry_id )
    using index enable;

