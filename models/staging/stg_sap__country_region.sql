with
    sap_adw_countryregion as(
        select
            cast(countryregioncode as string) as country_region_code
            ,cast(name as string) as country_region_name
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as country_region_modified_date
            
        from {{source('adv_work', 'countryregion')}}
    )

select *
from sap_adw_countryregion