CREATE DEFINER=`root`@`localhost` PROCEDURE `Z8`()
BEGIN
	declare p_yz_open_id varchar(50);
	declare p_created_time int;
	declare p_cost DECIMAL(10,2);
	declare p_last_order_time int;
	declare p_lost_cycle int;

	declare i int;			-- 客户订单表 后半部分
	set i = 59332 ;
	while i<= 61621 do

		select yz_open_id,created_time,cost					-- 找出客户ID、订单时间、费用
		into p_yz_open_id,p_created_time,p_cost
		from tbl_customer_order
		where id = i;
		
		
		set p_last_order_time = 1636560000;	
		
		select last_order_time
		into p_last_order_time
		from tbl_customer_order_time
		where yz_open_id = p_yz_open_id;
		
		
		if p_last_order_time = 1636560000 then 
	-- 		时间表里面没有
	-- 		第一条插入 客户id 两个时间一样 两个消费一样 

			insert into tbl_customer_order_time
			(yz_open_id, first_order_cost, first_order_time,
			last_order_cost, last_order_time, lost_cycle)
			VALUES(p_yz_open_id, p_cost, p_created_time,
			p_cost, p_created_time,-1);

		else 
	-- 		时间表里面有
	-- 		更新该客户id 的最后购买时间和最后购买金额
			set p_lost_cycle = FLOOR((p_created_time - p_last_order_time)/86400);

			update tbl_customer_order_time
			set last_order_time = p_created_time,
					last_order_cost = p_cost,
					lost_cycle = p_lost_cycle
			where yz_open_id = p_yz_open_id;

	end if;

		set i = i+1;
	end while;


END
