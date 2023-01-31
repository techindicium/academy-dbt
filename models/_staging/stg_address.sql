{{ config(
    schema = 'staging',
    full_refresh=true,
    materialized='view')
}}

with address as (
    select * from {{ source("sap_adw", "address") }}
)

, final as (
        select
            addressid,
            stateprovinceid,
            city,
            addressline2,
            modifieddate,
            rowguid,
            postalcode,
            spatiallocation,
            addressline1
        from {{ source("sap_adw", "address") }}
    )
select * from final
