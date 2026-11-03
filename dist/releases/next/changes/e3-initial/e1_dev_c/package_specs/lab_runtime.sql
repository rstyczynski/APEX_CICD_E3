-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841627 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/package_specs/lab_runtime.sql
-- sqlcl_snapshot src/database/e1_dev_c/package_specs/lab_runtime.sql:null:20ad4f35d79d7517021e6e2796fb8dae83b925a7:create

create or replace package lab_runtime authid definer as
    procedure assert_ready;

    function record_greeting (
        p_hello_id number default null,
        p_world_id number default null
    ) return varchar2;

end;
/

