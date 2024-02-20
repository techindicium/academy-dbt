with
    source_state_province as (
        select
            cast(stateprovinceid as int) as id_state_province
            , cast(territoryid as int) as id_territory
            , cast(name as string) as state_name
            , cast(isonlystateprovinceflag as boolean) as is_only_state_province_flag
            , cast(stateprovincecode as string) as state_province_code
            , cast(countryregioncode as string) as country_region_code
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
            , cast(rowguid as string) as row_guid
        from {{source('adw', 'stateprovince' )}}
    )
select *
from source_state_province