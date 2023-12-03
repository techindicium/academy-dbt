with
    fonte_workorder as (
        select
            cast(workorderid as int) as workorderid
            , cast(productid as int) as productid
            , cast(orderqty as int) as orderqty
            , cast(scrappedqty as int) as scrappedqty
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(duedate as timestamp) as duedate
            , cast(scrapreasonid as int) as scrapreasonid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'workorder') }}
    )

select *
from fonte_workorder