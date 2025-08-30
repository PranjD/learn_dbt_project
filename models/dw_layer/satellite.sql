select customer_hk, customer_name, customer_email,
customer_phone,load_dts,source
from {{ ref('sat_customer') }}