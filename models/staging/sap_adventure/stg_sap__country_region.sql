with
    source_countryregion as (
        select
            cast(countryregioncode as string) as country_region_code
            , cast(name as string) as country_name
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'stg_sap__country_region' )}}
    )
    select *
    from source_countryregion