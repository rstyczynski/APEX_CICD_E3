-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841977 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/greeting_history_immutable.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/greeting_history_immutable.sql:null:75140d8d3f0154e2bd5a2d4c99c11e227d014c58:create

create or replace editionable trigger greeting_history_immutable before
    update or delete on greeting_history
begin
    raise_application_error(-20305, 'Greeting history is immutable');
end;
/

alter trigger greeting_history_immutable enable;

