with
    source_customer as (
        select
            cast(customerid as int) as cliente_id
            , cast(personid as int) as pessoa_id
            -- , storeid
            -- , territoryid
            -- , rowguid
            -- , modifieddate
        from {{ source('sap', 'customer') }}
    )

select *
from source_customer