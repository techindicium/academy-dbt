with
    source_address as (
        select
            cast(addressid as int) as id_address
            , cast(stateprovinceid as int) as id_state_province
            , cast(city as string) as city
            , cast(addressline1 as string) as address_line_1
            , cast(addressline2 as string) as address_line_2
            , cast(postalcode as string) as postal_code
            , cast(spatiallocation as string) as spatial_location
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{ source('adw', 'stg_sap__address' ) }}
    )
select *
from source_address