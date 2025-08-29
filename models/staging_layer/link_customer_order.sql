{{
    config(
        materialized='incremental',
        unique_key='customer_order_hk'
    )
}}
WITH source_data AS (
    SELECT
        o.customer_id,
        o.order_id,
        {{current_timestamp()}} AS load_dts,
        'RAW' AS source
    FROM {{ source('source_data','raw_orders') }} o
    {% if is_incremental() %}
    WHERE MD5(CONCAT(customer_id,order_id)) NOT IN(
        SELECT customer_order_hk FROM {{ this }}
    )
{% endif %}
)

SELECT
    MD5(CONCAT(customer_id, order_id)) AS customer_order_hk,
    MD5(customer_id) AS customer_hk,
    MD5(order_id) AS order_hk,
    load_dts,
    source
FROM source_data
