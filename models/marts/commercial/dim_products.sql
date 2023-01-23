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
             salesorderdetail.id_salesorderdetail
            , salesorderdetail.id_product
            , salesorderdetail.id_specialoffer
            , salesorderdetail.orderqty
            , salesorderdetail.unitprice
            , salesorderdetail.unitpricediscount
            , salesorderdetail.rowguid
            , salesorderdetail.modifieddate
            , salesorderhead.id_salesorder
            , salesorderhead.id_customer
            , salesorderhead.id_salesperson
            , salesorderhead.id_territory
            , salesorderhead.id_billtoadress
            , salesorderhead.id_shiptoadress
            , salesorderhead.id_shipmethod
            , salesorderhead.id_creditcard        
            , salesorderhead.revisionnumber
            , salesorderhead.orderdate
            , salesorderhead.duedate
            , salesorderhead.shipdate
            , salesorderhead.status        
            , salesorderhead.onlineorderflag
            , salesorderhead.purchaseordernumber
            , salesorderhead.accountnumber
            , salesorderhead.creditcardappovalcode
            , salesorderhead.id_currencyrate        
            , salesorderhead.subtotal
            , salesorderhead.taxamt
            , salesorderhead.freight
            , salesorderhead.totaldue
            , salesorderhead.comment
            , salesorderhead.rowguid
            , salesorderhead.modifieddate
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
   --  select
   --    concat(id_product, id_salesorderdetail) as product_sk
   --  , *
   --    from joined_tables2
   --
   -- )

select *
from joined_tables2