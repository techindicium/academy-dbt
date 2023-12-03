with
    fonte_phonenumbertype as (
        select
            cast(phonenumbertypeid as int) as phonenumbertypeid
            , cast(name as string) as name
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'phonenumbertype') }}
    )

select *
from fonte_phonenumbertype