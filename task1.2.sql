SELECT fill.id, fill.client_id, IFNULL( fill.previous_credit_id, 0 ) previous_credit_id
FROM (

SELECT cr_main.id, cr_main.client_id, (

SELECT cr_child.id
FROM  `credit` cr_child
WHERE cr_child.client_id = cr_main.client_id
AND cr_child.created_at < cr_main.created_at
OR (
cr_child.created_at = cr_main.created_at
AND cr_child.id < cr_main.id
)
ORDER BY 1 DESC 
LIMIT 1
)previous_credit_id
FROM  `credit` cr_main
WHERE cr_main.client_id =2
ORDER BY 1
)fill