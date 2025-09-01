{{
    config(
        materialized='incremental',
        unique_key= 'customer_hk'
    )
}}
WITH source_data AS (
    SELECT
        customer_id,
        {{current_timestamp()}} AS load_dts,
        'RAW' AS source
    FROM {{ ref('customers') }}
    {% if is_incremental() %}
    WHERE MD5(customer_id) NOT IN(
        SELECT customer_hk FROM {{ this }}
    )
{% endif %}
)

SELECT
    MD5(customer_id) AS customer_hk,
    customer_id,
    load_dts,
    source
FROM source_data
