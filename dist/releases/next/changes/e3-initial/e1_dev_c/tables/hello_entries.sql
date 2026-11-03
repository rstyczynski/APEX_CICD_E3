-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841735 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/hello_entries.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/hello_entries.sql:null:81cf9e25c08b40788bd53e7272cd25aa6cc9173f:create

create table hello_entries (
    entry_id   number generated always as identity not null enable,
    entry_text varchar2(100 char) not null enable,
    active     char(1 byte) default 'Y' not null enable
);

alter table hello_entries
    add
        check ( active in ( 'Y', 'N' ) ) enable;

alter table hello_entries
    add constraint hello_text_nonblank check ( regexp_like ( entry_text,
                                                             '[^[:space:]]' ) ) enable;

alter table hello_entries
    add constraint hello_text_valid
        check ( length(trim(entry_text)) between 1 and 100 ) enable;

alter table hello_entries add primary key ( entry_id )
    using index enable;

