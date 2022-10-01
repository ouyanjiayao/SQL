-- F:\MariaDB\bin 
mysql -uroot -p
-- 修改密码，刷新权限
use mysql;
UPDATE mysql.user SET authentication_string = PASSWORD('password'), plugin = 'mysql_native_password' WHERE User = 'root';
flush privileges;
quit;
