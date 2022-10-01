 select CONCAT('SHOW TABLE STATUS from `db` where name="',table_name,'";')
 from information_schema.tables
 where table_schema='db' ;
