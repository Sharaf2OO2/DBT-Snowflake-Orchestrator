SELECT order_date,
        order_id,
        SUM(total_price) total_price
FROM {{ ref('stg_orders') }}
LEFT JOIN {{ ref('stg_order_items') }} USING(order_id)
GROUP BY 1, 2