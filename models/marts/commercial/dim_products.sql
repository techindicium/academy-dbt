with 
    salesorderhead as (
        select *
        from {{ ref('stg_sap__salesorderhead') }}
    )

    , salesorderdetail as (
        select *
        from {{ ref('stg_sap__salesorderdetail') }}
    )

    , products as (
        select 
            distinct(id_product)
        from {{ ref('stg_sap__products') }}
    )
    
    , joined_tables_detail_head as (
        select   
        *
        from salesorderhead
        left join salesorderdetail on
        salesorderhead.id_salesorder = salesorderdetail.id_salesorder
    )

    , joined_tables2 as (
        select
         *
        from products
        left join joined_tables_detail_head on products.id_product = joined_tables_detail_head.id_salesorderdetail
    )

   --, transformed as (
    -- select
    --   concat() over (order by products.id_product) as product_sk
    --   ,*
    --    from joined_tables2
    --)

select *
from joined_tables2