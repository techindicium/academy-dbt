with
    fonte_billofmaterials as (
        select
            cast(billofmaterialsid as int) as billofmaterialsid
            , cast(productassemblyid as int) as productassemblyid
            , cast(componentid as int) as componentid
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(unitmeasurecode as string) as unitmeasurecode
            , cast(bomlevel as int) as bomlevel
            , cast(perassemblyqty as int) as perassemblyqty
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'billofmaterials') }}
    )

select *
from fonte_billofmaterials