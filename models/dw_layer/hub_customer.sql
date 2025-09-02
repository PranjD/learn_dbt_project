select customer_hk,customer_id,
load_dts,source
from {{ ref('stg_hub_customer') }}