SELECT * FROM information_schema.events  where event_schema = 'db_name'


SELECT CONCAT('DROP event ',event_name,';') FROM information_schema.events where event_schema = 'db_name'
