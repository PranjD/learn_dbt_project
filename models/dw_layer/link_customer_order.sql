select customer_order_hk,
customer_hk,order_hk,load_dts,
source from {{ ref('stg_link_customer_order') }}