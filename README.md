Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

DBT Data Vault Project :

1. Project Overview :
This project demonstrates a simplified Data Vault implementing using dbt and
it project extracts and transforms raw customer and raw order data from the
"dbt_project.raw" schema and builds a structured data warehouse in pc_dbt_db with
dimentional tables using dbt.
It uses:
-Incremental models for efficient processing
- Surrogate keys for slowly changing dimensions
- Macros for DRY code (e.g. timestamp) 
- Tests for data quality and validation
- Data Lineage tracking and testing via dbt docs and 'schema.yml'

2. Business Context and use cases:
As this is for Customer analysis to track customer performance, monitor 
order processing, ensures consistent and reliable data, support growing data 
and new sources.

3. Project Structure:

dbt_project.yml configuration file used for project metadata and model 
organization and all.

Project Raw_layer ---- source data
|---raw_customers
|-raw_orders

(refrenced via sources.yml)

---Project models:
Project staging_layer
|---models/
|----hub_customer.sql
|----link_customer_order.sql
|----sat_customer.sql
|--schema.yml for documentation,tests etc.

Project dw_layer
|---hub.sql
|----link.sql
|-----astellite.sql

---Project tests:
|--singular tests for validation 
|---test_invalid_emails.sql

---Project macros:
|----Used for write code once and reuse it whenever required.
|---- macros.yml, timestamp.sql

4. setup Instructions :
a. create snowflake account
b. install dbt cloud
c. create github repo and all connections
d. run all dbt commands for testing

---Project:
|----Snowflake_scripts
|-------snowflake_setup.txt
|-------Raw tables creation and insertion.txt

---Project:
|----Project_logs
|-------LOG structure.txt
|-------Run summary.txt
|------DEBUG.txt
|------run_results.json

6. Flow summary:
a. Raw layer : manually created in snowflake actual tables holds the source data
b. Source Definition : configuration of source data
c. Staging models : For applying hashing,timestamps, using incremental models
for performance. 
d. DW layer models : simple curated outputs for downstream use.
e. Documentation and testing : provides description and built in tests.

7. Live documentation :
   dbt docs ->  https://pranjd.github.io/learn_dbt_project/

