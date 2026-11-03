-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842163 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/world_config_no_delete.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/world_config_no_delete.sql:null:336455b8b82307548696ee9ca5e7648afcd4b97d:create

create or replace editionable trigger world_config_no_delete before
    delete on world_config
begin
    raise_application_error(-20323, 'World configuration cannot be deleted');
end;
/

alter trigger world_config_no_delete enable;

