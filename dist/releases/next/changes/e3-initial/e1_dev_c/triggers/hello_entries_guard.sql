-- liquibase formatted sql
-- changeset E1_DEV_C:1793718842093 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/triggers/hello_entries_guard.sql
-- sqlcl_snapshot src/database/e1_dev_c/triggers/hello_entries_guard.sql:null:e3a228c9a1956f33027a8e2fcbf323c10e64bb0f:create

create or replace editionable trigger hello_entries_guard before
    insert or update on hello_entries
    for each row
declare
    n number;
begin
    lab_runtime.assert_ready;
    :new.entry_text := regexp_replace(:new.entry_text,
                                      '^[[:space:]]+|[[:space:]]+$',
                                      '');
    if :new.entry_text is null then
        raise_application_error(-20314, 'Hello entry must contain non-whitespace text');
    end if;

    if :new.active = 'N' then
        select
            count(*)
        into n
        from
            hello_config
        where
            default_entry_id = :new.entry_id;

        if n > 0 then
            raise_application_error(-20310, 'Choose another active Hello default before deactivation');
        end if;
    end if;

end;
/

alter trigger hello_entries_guard enable;

