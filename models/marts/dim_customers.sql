{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    email,
    UPPER(city) as CITY,
    created_at
FROM {{ ref('stg_customers') }}