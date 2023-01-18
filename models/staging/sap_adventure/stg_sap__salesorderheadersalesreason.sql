with
    source_salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as id_salesorder
            , cast(productid as int) as id_product
            , cast(salesreasonid as int) as id_salesreason
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{source('adw', 'salesorderheadersalesreason' )}}
    )
    select *
    from source_salesorderheadersalesreason