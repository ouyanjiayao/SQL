SELECT *
FROM testdelete a
WHERE (a.one,a.two,a.three) IN (SELECT
                                ONE,
                                two,
                                three
                              FROM testdelete
                              GROUP BY ONE,two,three
                              HAVING COUNT( * ) > 1)
    AND id NOT IN(SELECT
                    MIN(id) AS id
                  FROM testdelete
                  GROUP BY ONE,two,three
                  HAVING COUNT( * ) > 1)




delete from sku_price where id not in (
		select t.max_id from 
		(select max(id) as max_id from sku_price group by goods_id,sku_id) as t
		);


SELECT count(DISTINCT(id)) from sku_price GROUP BY sku_id,goods_id;
