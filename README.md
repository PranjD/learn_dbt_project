Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


This project extracts and transforms raw customer and raw order data from the
"dbt_project.raw" schema and builds a structured data warehouse in pc_dbt_db with
dimentional tables using dbt.
It uses:
-Incremental models for efficient processing
- Surrogate keys for slowly changing dimensions
- Macros for DRY code (e.g. timestamp) 
- Tests for data quality and validation
- Data Lineage tracking and testing via dbt docs and 'schema.yml'