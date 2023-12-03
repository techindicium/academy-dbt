with
    fonte_employee as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(nationalidnumber as bigint) as nationalidnumber
            , cast(loginid as string) as loginid
            , cast(jobtitle as string) as jobtitle
            , cast(birthdate as date) as birthdate
            , cast(maritalstatus as string) as maritalstatus
            , cast(gender as string) as gender
            , cast(hiredate as date) as hiredate
            , cast(salariedflag as bool) as salariedflag
            , cast(vacationhours as int) as vacationhours
            , cast(sickleavehours as int) as sickleavehours
            , cast(currentflag as bool) as currentflag
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
            , cast(organizationnode as string) as organizationnode
        from {{ source('sap_adventure_works', 'employee') }}
    )

select *
from fonte_employee