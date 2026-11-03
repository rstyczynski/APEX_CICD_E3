-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842212 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/world_entries_no_delete.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/world_entries_no_delete.sql:null:9baaace8cc0097746ccb8f1fc2653eef89d5c035:create

create or replace editionable trigger world_entries_no_delete before
    delete on world_entries
begin
    raise_application_error(-20321, 'Deactivate World entries instead of deleting');
end;
/

alter trigger world_entries_no_delete enable;

