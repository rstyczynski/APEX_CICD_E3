set echo off verify off define off
whenever sqlerror exit failure rollback
whenever oserror exit failure rollback
connect -name e3-target
begin
  if user <> 'E3_TARGET' then raise_application_error(-20931,'Unexpected target'); end if;
  apex_util.set_security_group_id(apex_util.find_security_group_id('E3_TARGET'));
  apex_application_admin.set_application_status(
    p_application_id => 810203, p_application_status => 'RESTRICTED_ACCESS',
    p_restricted_to_user_list => 'VERIFIER');
  commit;
end;
/
exit success
