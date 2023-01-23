with
    source_stateprovince as (
        select
            cast(stateprovinceid as int) as id_stateprovince
            , cast(territoryid as int) as id_territory
            , cast(name as string) as state_name
            , cast(isonlystateprovinceflag as boolean) as isonlystateprovinceflag
            , cast(stateprovincecode as string) as stateprovincecode
            , cast(countryregioncode as string) as countryregioncode
            , cast(modifieddate as TIMESTAMP) as modifieddate
            , cast(rowguid as string) as rowguid
        from {{source('adw', 'stateprovince' )}}
    )
    select *
    from source_stateprovince