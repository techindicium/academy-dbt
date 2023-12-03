with
    fonte_salestaxrate as (
        select *
        from {{ source('sap_adventure_works', 'salestaxrate') }}
    )

select *
from fonte_salestaxrate