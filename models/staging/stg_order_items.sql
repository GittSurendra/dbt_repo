{{ config(materialized='view') }}

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity
FROM {{ source('raw', 'order_items') }}
