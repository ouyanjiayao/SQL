use information_schema;
select sum(table_rows) from tables where TABLE_SCHEMA = "test" order by table_rows asc;
