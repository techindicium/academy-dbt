with
    source_countryregion as (
        select
            cast(countryregioncode as string) as countryregioncode
            , cast(name as string) as country_name
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{source('adw', 'countryregion' )}}
    )
    select *
    from source_countryregion