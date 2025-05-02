SELECT id order_id,
        customer_id,
        order_date,
        {{ classify_quarter('order_date') }} AS quarter,
        status
FROM {{ source('raw_data', 'orders') }}