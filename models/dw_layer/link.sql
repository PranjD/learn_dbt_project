select customer_order_hk,
customer_hk,order_hk,load_dts,
source from {{ ref('link_customer_order') }}