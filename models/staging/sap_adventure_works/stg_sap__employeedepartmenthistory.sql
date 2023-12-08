with
    fonte_employeedepartmenthistory as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(departmentid as int) as departmentid
            , cast(shiftid as int) as shiftid
            , cast(startdate as date) as startdate
            , cast(enddate as date) as enddate
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'employeedepartmenthistory') }}
    )

select *
from fonte_employeedepartmenthistory