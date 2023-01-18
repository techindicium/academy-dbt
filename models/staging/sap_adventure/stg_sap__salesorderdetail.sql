with
    source_salesorderdetail as (
        select
            cast(salesorderid as int) as id_salesorder
            , cast (productid as int) as id_product
            , cast(salesorderdetailid as int) as id_salesorderdetail
            , cast(specialofferid as int) as id_specialoffer
            , cast(orderqty as int) as orderqty 
            , cast(unitprice as int) as unitprice
            , cast(unitpricediscount as int) as unitpricediscount
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{source('adw', 'salesorderdetail' )}}
    )
    select *
    from source_salesorderdetail