-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841653 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/ref_constraints/world_config.world_entries.sql
-- sqlcl_snapshot src/database/e1_dev_c/ref_constraints/world_config.world_entries.sql:null:8eb98b80d3ca26512d0f77899fd5232b8b646330:create

alter table world_config
    add
        foreign key ( default_entry_id )
            references world_entries ( entry_id )
        enable;

