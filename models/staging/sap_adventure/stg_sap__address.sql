with
    source_address as (
        select
            cast(addressid as int) as id_address
            , cast(stateprovinceid as int) as id_stateprovince
            , cast(city as string) as city
            , cast(addressline1 as string) as addressline1
            , cast(addressline2 as string) as addressline2
            , cast(postalcode as string) as postalcode
            , cast(spatiallocation as string) as spatiallocation
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{ source('adw', 'address' ) }}
    )
    select *
    from source_address