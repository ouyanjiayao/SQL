SELECT
        CONCAT( "ALTER TABLE `", table_schema, "`.`", table_name, "` ROW_FORMAT =DYNAMIC ;" ) 
FROM
        information_schema.TABLES 
WHERE
        table_schema IN ( 'client' );
