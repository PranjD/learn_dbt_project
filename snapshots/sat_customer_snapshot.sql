{% snapshot sat_customer_snapshot %}
    {{
        config(
            target_schema='staging',
            target_database='dbt_project',
            unique_key='customer_hk',
            strategy='check',
            check_cols=['customer_name','customer_email','customer_name']
        )
    }}

    select customer_hk,
    customer_name,
    customer_email,
    customer_phone,
    load_dts,
    source from {{ ref('sat_customer') }}
 {% endsnapshot %}
