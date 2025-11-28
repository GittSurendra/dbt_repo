{{ config(materialized='view') }}

SELECT
    customer_id,
    UPPER(customer_name) AS customer_name,
    email,
    city,
    created_at
FROM {{ source('raw', 'customers') }} 
