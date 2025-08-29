SELECT *
FROM {{ ref('sat_customer') }}
WHERE customer_email NOT LIKE '%@%.%'