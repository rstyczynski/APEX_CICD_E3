-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842005 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/greeting_history_insert_guard.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/greeting_history_insert_guard.sql:null:cafd28f9c7a8f90364a7db753cd11815b1763318:create

create or replace editionable trigger greeting_history_insert_guard before
    insert on greeting_history
begin
    lab_runtime.assert_ready;
end;
/

alter trigger greeting_history_insert_guard enable;

