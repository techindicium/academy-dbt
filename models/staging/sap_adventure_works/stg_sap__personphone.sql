with
    fonte_personphone as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(phonenumber as string) as phonenumber
            , cast(phonenumbertypeid as int) as phonenumbertypeid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'personphone') }}
    )

select *
from fonte_personphone