-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842141 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/world_config_guard.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/world_config_guard.sql:null:82453df741fcffd0ec7e225bb85a64ed008f4796:create

create or replace editionable trigger world_config_guard before
    insert or update on world_config
    for each row
declare
    n number;
begin
    lab_runtime.assert_ready;
    select
        count(*)
    into n
    from
        world_entries
    where
            entry_id = :new.default_entry_id
        and active = 'Y';

    if n <> 1 then
        raise_application_error(-20322, 'World default must be an active World entry');
    end if;
end;
/

alter trigger world_config_guard enable;

