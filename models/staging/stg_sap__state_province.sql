with
    sap_adw_stateprovince as(
        select
            cast(stateprovinceid as int64) as state_province_id
            ,cast(countryregioncode as string) as state_province_country_region_code
            ,cast(name as string) as state_province_name
            ,cast(territoryid as int64)  as state_province_territory_id
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as state_province_modified_date
        from {{source('adv_work', 'stateprovince')}}
    )

select *
from sap_adw_stateprovince

