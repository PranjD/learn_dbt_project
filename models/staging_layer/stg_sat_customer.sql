{{
    config(
        materialized='table'
    )
}}
WITH source_data AS (
    SELECT
        customer_id,
        customer_name,
        customer_email,
        customer_phone,
        {{current_timestamp()}} AS load_dts,
        'RAW' AS source
    FROM {{ ref('customers') }}
)
SELECT
    MD5(customer_id) AS customer_hk,
    customer_name,
    customer_email,
    customer_phone,
    load_dts,
    source
FROM source_data
