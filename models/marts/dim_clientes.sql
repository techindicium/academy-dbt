with
    sap_customers as (
        select
        cliente_id
        , pessoa_id
        from {{ ref('stg_sap__customers') }}
    )

select *
from sap_customers
