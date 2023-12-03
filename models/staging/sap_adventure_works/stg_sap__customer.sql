with
    fonte_customer as (
        select
            cast(customerid as int) as customerid
            , cast(personid as int) as personid
            , cast(storeid as int) as storeid
            , cast(territoryid as int) as territoryid
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'customer') }}
    )

select *
from fonte_customer