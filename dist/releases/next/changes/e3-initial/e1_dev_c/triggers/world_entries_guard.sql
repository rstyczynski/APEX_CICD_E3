-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842189 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/world_entries_guard.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/world_entries_guard.sql:null:1ebd4b0b5621ab3822e0555d96f304ff1e664774:create

create or replace editionable trigger world_entries_guard before
    insert or update on world_entries
    for each row
declare
    n number;
begin
    lab_runtime.assert_ready;
    :new.entry_text := trim(:new.entry_text);
    if :new.active = 'N' then
        select
            count(*)
        into n
        from
            world_config
        where
            default_entry_id = :new.entry_id;

        if n > 0 then
            raise_application_error(-20320, 'Choose another active World default before deactivation');
        end if;
    end if;

end;
/

alter trigger world_entries_guard enable;

