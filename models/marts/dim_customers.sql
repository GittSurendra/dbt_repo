{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    email,
    city,
    created_at
FROM {{ ref('stg_customers') }}