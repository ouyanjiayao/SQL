select name as '商品名称',sku_name as '规格',handle as '加工方式' ,weight as '重量',sum(weight*count) as '总重量',sum(count) as '数量', 
tag_name as '分类' 

into outfile  "D:/GoodsDetail/20220909.csv" character set gbk fields terminated by ',' optionally enclosed by '\"' lines terminated by '\n' 

from bill_dp group by dp_name,sku_name,handle ORDER BY id DESC
