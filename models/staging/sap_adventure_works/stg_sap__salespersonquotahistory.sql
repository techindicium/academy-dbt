with
    fonte_salespersonquotahistory as (
        select *
        from {{ source('sap_adventure_works', 'salespersonquotahistory') }}
    )

select *
from fonte_salespersonquotahistory