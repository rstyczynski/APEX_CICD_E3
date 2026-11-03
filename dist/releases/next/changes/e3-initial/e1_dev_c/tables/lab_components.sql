-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841805 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/tables/lab_components.sql
-- sqlcl_snapshot src/database/e1_dev_c/tables/lab_components.sql:null:ca2628df7efe3939d3ae5679fe0d3a93272f461e:create

create table lab_components (
    component varchar2(20 byte),
    installed number(1, 0) not null enable,
    version   varchar2(30 byte)
);

alter table lab_components
    add
        check ( installed in ( 0, 1 ) ) enable;

alter table lab_components
    add constraint lab_component_presence
        check ( ( installed = 0
                  and version is null )
                or ( installed = 1
                     and version is not null ) ) enable;

alter table lab_components add primary key ( component )
    using index enable;

