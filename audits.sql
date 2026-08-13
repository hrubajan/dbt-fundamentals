---------------------------------------------
-- Compare Row Counts
---------------------------------------------

{% set old_relation=adapter.get_relation(
    database = target.database,
    schema = "JANA_DBTLEARN",
    identifier = "customer_orders_legacy"
) %} 

{% set dbt_relation=ref('fct_customer_orders') %}  

{{ audit_helper.compare_row_counts(
        a_relation=old_etl_relation,
        b_relation=dbt_relation,
) }}