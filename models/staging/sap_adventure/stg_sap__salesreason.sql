with
    source_salesreason as (
        select
            cast(salesreasonid as int) as id_salesreason
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reasontype
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{source('adw', 'salesreason' )}}
    )
    select *
    from source_salesreason