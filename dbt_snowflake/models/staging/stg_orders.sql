SELECT id order_id,
        customer_id,
        order_date,
        status
FROM {{ source('raw_data', 'orders') }}