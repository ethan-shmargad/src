CREATE USER aijs identified BY Welcome12345;
grant CREATE session TO aijs;
grant RESOURCE, db_developer_role TO aijs;
grant unlimited tablespace TO aijs;

grant EXECUTE ON javascript TO aijs;
grant EXECUTE dynamic mle TO aijs;

grant create session,resource,dba to aijs;
grant execute on dbms_network_acl_admin to aijs;

BEGIN
 DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
 (
            host => 'api-inference.huggingface.co',
      lower_port => 80,
      upper_port => 8888,
             ace => xs$ace_type(privilege_list => xs$name_list('http'),
  principal_name => 'aijs',
  principal_type => xs_acl.ptype_db)
 );
END;
/

connect aijs/Welcome12345;

