SELECT id item_id,
        order_id,
        product_id,
        quantity,
        unit_price,
        {{ total_price('unit_price', 'quantity') }} total_price
FROM {{ source('raw_data', 'order_items') }}