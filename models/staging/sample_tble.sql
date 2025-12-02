{{ config(materialized='table') }}

select 
customer_id,
email 
from 
{{ source('raw','customers')}}
