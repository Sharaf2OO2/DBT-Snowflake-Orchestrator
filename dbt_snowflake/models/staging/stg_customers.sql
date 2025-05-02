SELECT id customer_id,
        name,
        email,
        country
FROM {{ source('raw_data', 'customers') }}