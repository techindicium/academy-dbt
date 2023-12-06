with
    fonte_workorderrouting as (
        select
            cast(workorderid as int) as workorderid
            , cast(productid as int) as productid
            , cast(operationsequence as int) as operationsequence
            , cast(locationid as int) as locationid
            , cast(scheduledstartdate as timestamp) as scheduledstartdate
            , cast(scheduledenddate as timestamp) as scheduledenddate
            , cast(actualstartdate as timestamp) as actualstartdate
            , cast(actualenddate as timestamp) as actualenddate
            , cast(actualresourcehrs as decimal) as actualresourcehrs
            , cast(plannedcost as decimal) as plannedcost
            , cast(actualcost as decimal) as actualcost
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'workorderrouting') }}
    )

select *
from fonte_workorderrouting