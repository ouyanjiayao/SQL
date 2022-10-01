查看用户
SELECT User, Host, Password FROM mysql.user;
创建新用户
create user linyifan@'%' identified by "linyifan"; 
查看用户权限
show grants for root@'%';
授予权限
grant select on db1.user to jack@'%';

删除用户
drop user test@'localhost';
移除权限
REVOKE privileges ON *.* FROM test@'localhost';
授予所有权限
grant all privileges on *.* to test@'localhost' identified by 'linyifan' with grant option;

create user fanfan@'%' identified by "123456"; 

grant select on test.* to fanfan@'%';

grant all privileges on test.* to test@'localhost' identified by 'abc.test' with grant option;

grant all test.* to test@'localhost';

