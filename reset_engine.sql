SELECT CONCAT(concat('alter table ',TABLE_NAME,' ENGINE=INNODB;')) 
from information_schema.TABLES as t
where table_schema = 'test'
and TABLE_type = 'BASE TABLE'
and ENGINE = 'MyISAM'
