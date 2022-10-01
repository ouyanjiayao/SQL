BEGIN

DECLARE static_time VARCHAR(11) character set utf8;

DECLARE cost decimal(11,2);

SELECT UNIX_TIMESTAMP(`delivery_time`) INTO @static_time from `db`.`bill_dp` as od where od.id=new.`id`;

SELECT `cost` INTO @cost from `db`.`daily_cost` as dc where dc.goods_id = new.`dp_goods_id` and dc.`update_time` < new.`delivery_time` and dc.`sku_id`=new.`sku_id`
ORDER BY dc.`id` desc limit 1;
SET new.unit_price = @cost;

END




BEGIN

	DECLARE p_memo VARCHAR(5);
	DECLARE p_com_num int;
	DECLARE flag int;
	
	set flag = 0;
	set p_memo = new.seller_memo;
	
	select INSTR(p_memo,'错发')
	into flag; 
	
	
	if flag = 0 then
		select INSTR(p_memo,'配送')
		into flag; 
	end if;
		
		
	if flag = 0 then
		select INSTR(p_memo,'漏发')
		into flag; 
	end if;
	
	if flag = 0 then
		select INSTR(p_memo,'规格')
		into flag; 
	end if;
	
	
	if flag = 0 then
		select INSTR(p_memo,'质量')
		into flag; 
	end if;
	
		
	if flag = 0 then
		select INSTR(p_memo,'延误')
		into flag; 
	end if;
	
	
	if flag != 0 then
		select customer_complaints_num
		into p_com_num
		from customer
		where open_id = new.open_id;
	
		set p_com_num = p_com_num + 1;

		update customer
		set customer_complaints_num = p_com_num
		where open_id = new.open_id;
		
	end if;

END
