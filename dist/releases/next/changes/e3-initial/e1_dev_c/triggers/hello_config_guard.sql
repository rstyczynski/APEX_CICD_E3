-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842039 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/hello_config_guard.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/hello_config_guard.sql:null:d18cf299229694ed0cb5331afc243778c562623f:create

create or replace editionable trigger hello_config_guard before
    insert or update on hello_config
    for each row
declare
    n number;
begin
    lab_runtime.assert_ready;
    select
        count(*)
    into n
    from
        hello_entries
    where
            entry_id = :new.default_entry_id
        and active = 'Y';

    if n <> 1 then
        raise_application_error(-20312, 'Hello default must be an active Hello entry');
    end if;
end;
/

alter trigger hello_config_guard enable;

