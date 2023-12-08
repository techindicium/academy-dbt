with
    fonte_addresstype as (
        select
            cast(addresstypeid as int) as addresstypeid
            , cast(name as string) as name
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'addresstype') }}
    )

select *
from fonte_addresstype