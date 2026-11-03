-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842117 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/hello_entries_no_delete.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/hello_entries_no_delete.sql:null:069bb5891a6ab12a429364ad15e4f6ea3b511ae6:create

create or replace editionable trigger hello_entries_no_delete before
    delete on hello_entries
begin
    raise_application_error(-20311, 'Deactivate Hello entries instead of deleting');
end;
/

alter trigger hello_entries_no_delete enable;

