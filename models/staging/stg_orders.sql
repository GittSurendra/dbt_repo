{{ config(materialized='view') }}

SELECT
    order_id,
    customer_id,
    order_amount,
    order_date,
    status
FROM {{ source('raw', 'orders') }}