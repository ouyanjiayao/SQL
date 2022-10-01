select CONCAT('truncate table test.',TABLE_NAME,';') FROM information_schema.TABLES WHERE TABLE_SCHEMA='test';
