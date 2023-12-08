with
    fonte_transactionhistory as (
        select
            cast(transactionid as int) as transactionid
            , cast(productid as int) as productid
            , cast(referenceorderid as int) as referenceorderid
            , cast(referenceorderlineid as int) as referenceorderlineid
            , cast(transactiondate as timestamp) as transactiondate
            , cast(transactiontype as string) as transactiontype
            , cast(quantity as int) as quantity
            , cast(actualcost as decimal) as actualcost
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'transactionhistory') }}
    )

select *
from fonte_transactionhistory