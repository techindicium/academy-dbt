with
    fonte_department as (
        select
            cast(departmentid as int) as departmentid
            , cast(name as string) as name
            , cast(groupname as string) as groupname
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'department') }}
    )

select *
from fonte_department