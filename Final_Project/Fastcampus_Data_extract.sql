# Q1-1.

SELECT cu.*, ot.*, co.*, rt.*
FROM customer_table cu
INNER JOIN order_table ot ON cu.customer_id = ot.customer_id 
INNER JOIN course_table co ON ot.course_id = co.course_id 
INNER JOIN refund_adj_table rt ON ot.order_id = rt.order_id;


# Q1-2.
SELECT DISTINCT
    DATE(created_at) AS date,
    FIRST_VALUE(name) OVER (
        PARTITION BY DATE(created_at) 
        ORDER BY created_at 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS first_applied_course,
    LAST_VALUE(name) OVER (
        PARTITION BY DATE(created_at) 
        ORDER BY created_at 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_applied_course
FROM
    order_table
WHERE
    created_at BETWEEN '2022-01-01' AND '2022-01-31'
ORDER BY
    date;
    
# Q1-3.
WITH daily_sales AS (
    SELECT
        DATE(created_at) AS sales_date,
        SUM(list_price) AS total_sales
    FROM order_table
    GROUP BY sales_date
)
SELECT
    sales_date,
    total_sales,
    LAG(total_sales) OVER (ORDER BY sales_date) AS yesterday_sales,
    LEAD(total_sales) OVER (ORDER BY sales_date) AS tomorrow_sales
FROM daily_sales
ORDER BY sales_date;