with
    source_store as (
        select
            cast(businessentityid as int) as id_businessentity
            , cast(salespersonid as int) as id_salesperson
            , cast(name as string) as store_name
            , cast(modifieddate as TIMESTAMP) as date_modificed
        from {{source('adw', 'store' )}}
         )
    select *
    from source_store