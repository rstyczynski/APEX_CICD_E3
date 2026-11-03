-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841671 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/greeting_history.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/greeting_history.sql:null:cbbeff1016febff42226cea0ac612432b2e3a4c0:create

create table greeting_history (
    greeting_id    number generated always as identity not null enable,
    hello_entry_id number not null enable,
    world_entry_id number not null enable,
    hello_text     varchar2(100 char) not null enable,
    world_text     varchar2(100 char) not null enable,
    hello_prefix   varchar2(30 char),
    world_prefix   varchar2(30 char),
    greeting_text  varchar2(261 char) not null enable,
    created_at     timestamp(6) with time zone default systimestamp not null enable,
    actor          varchar2(255 char) not null enable
);

alter table greeting_history add primary key ( greeting_id )
    using index enable;

