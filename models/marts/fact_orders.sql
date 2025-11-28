{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.order_date,
    o.order_amount,
    o.status,
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_order_value,
    COUNT(oi.order_item_id) AS total_items
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_customers') }} c
    ON o.customer_id = c.customer_id
LEFT JOIN {{ ref('stg_order_items') }} oi
    ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_products') }} p
    ON oi.product_id = p.product_id
GROUP BY
    o.order_id,
    o.order_date,
    o.order_amount,
    o.status,
    c.customer_id,
    c.customer_name
