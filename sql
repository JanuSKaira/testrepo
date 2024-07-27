select user_id,spend, transaction_date from
(SELECT user_id,spend, transaction_date,
row_number() 
over(PARTITION BY user_id 
order by transaction_date) as rnk
FROM transactions)x
where rnk=3