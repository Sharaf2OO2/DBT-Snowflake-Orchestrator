SELECT id product_id,
        name,
        category,
        price
FROM {{ source('raw_data', 'products') }}