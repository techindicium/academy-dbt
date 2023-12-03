with
    fonte_salestaxrate as (
        select
            cast(salestaxrateid as int) as salestaxrateid
            , cast(stateprovinceid as int) as stateprovinceid
            , cast(taxtype as int) as taxtype
            , cast(taxrate as float) as taxrate
            , cast(name as string) as name
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salestaxrate') }}
    )

select *
from fonte_salestaxrate