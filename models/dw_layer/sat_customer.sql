select customer_hk, customer_name, customer_email,
customer_phone,load_dts,source
from {{ ref('stg_sat_customer') }}