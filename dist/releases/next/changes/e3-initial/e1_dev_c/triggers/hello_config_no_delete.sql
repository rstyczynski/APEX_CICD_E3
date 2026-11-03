-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842061 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/hello_config_no_delete.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/hello_config_no_delete.sql:null:fa742bef7a607471d493db9ba3cf0cb02cdd7d10:create

create or replace editionable trigger hello_config_no_delete before
    delete on hello_config
begin
    raise_application_error(-20313, 'Hello configuration cannot be deleted');
end;
/

alter trigger hello_config_no_delete enable;

