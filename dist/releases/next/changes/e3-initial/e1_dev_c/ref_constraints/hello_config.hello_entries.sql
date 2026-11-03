-- liquibase formatted sql
-- changeset E1_DEV_C:1793718841640 stripComments:false  logicalFilePath:e3-initial/e1_dev_c/ref_constraints/hello_config.hello_entries.sql
-- sqlcl_snapshot src/database/e1_dev_c/ref_constraints/hello_config.hello_entries.sql:null:4ec1cc7f8c23b111de92e96fb425d78eb9709e2d:create

alter table hello_config
    add
        foreign key ( default_entry_id )
            references hello_entries ( entry_id )
        enable;

