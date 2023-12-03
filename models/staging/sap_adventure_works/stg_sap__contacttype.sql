with
    fonte_contacttype as (
        select
            cast(contacttypeid as int) as contacttypeid
            , cast(name as string) as name
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'contacttype') }}
    )

select *
from fonte_contacttype