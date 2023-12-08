with
    stg_vendor as (
        select *
        from {{ ref('stg_sap__vendor') }}
    )

    , stg_purchaseorderdetail as (
        select *
        from {{ ref('stg_sap__purchaseorderdetail') }}
    )

    , stg_purchaseorderheader as (
        select *
        from {{ ref('stg_sap__purchaseorderheader') }}
    )

    , stg_shipmethod as (
        select *
        from {{ ref('stg_sap__shipmethod') }}
    )

    , stg_productvendor as (
        select *
        from {{ ref('stg_sap__productvendor') }}
    )

    , join_purchasing as (
        select 
            stg_vendor.businessentityid
            , stg_vendor.accountnumber
            , stg_vendor.name as name_vendor
            , stg_vendor.creditrating
            , stg_vendor.preferredvendorstatus
            , stg_vendor.activeflag
            , stg_vendor.purchasingwebserviceurl
            , stg_vendor.modifieddate as modifieddate_vendor
            , stg_purchaseorderdetail.purchaseorderid
            , stg_purchaseorderdetail.purchaseorderdetailid
            , stg_purchaseorderdetail.duedate
            , stg_purchaseorderdetail.orderqty
            , stg_purchaseorderdetail.productid
            , stg_purchaseorderdetail.unitprice
            , stg_purchaseorderdetail.receivedqty
            , stg_purchaseorderdetail.rejectedqty
            , stg_purchaseorderdetail.modifieddate as modifieddate_purchaseorderdetail
            , stg_purchaseorderheader.revisionnumber
            , stg_purchaseorderheader.status
            , stg_purchaseorderheader.employeeid
            , stg_purchaseorderheader.vendorid
            , stg_purchaseorderheader.shipmethodid
            , stg_purchaseorderheader.orderdate
            , stg_purchaseorderheader.shipdate
            , stg_purchaseorderheader.subtotal
            , stg_purchaseorderheader.taxamt
            , stg_purchaseorderheader.freight
            , stg_purchaseorderheader.modifieddate as modifieddate_purchaseorderheader
            , stg_shipmethod.name as name_shipmethod
            , stg_shipmethod.shipbase
            , stg_shipmethod.shiprate
            , stg_shipmethod.rowguid
            , stg_shipmethod.modifieddate as modifieddate_shipmethod
            , stg_productvendor.averageleadtime
            , stg_productvendor.standardprice
            , stg_productvendor.lastreceiptcost
            , stg_productvendor.lastreceiptdate
            , stg_productvendor.minorderqty
            , stg_productvendor.maxorderqty
            , stg_productvendor.onorderqty
            , stg_productvendor.unitmeasurecode
            , stg_productvendor.modifieddate as modifieddate_productvendor
        from stg_vendor
        left join stg_productvendor
            on stg_vendor.BusinessEntityID = stg_productvendor.BusinessEntityID
        left join stg_purchaseorderdetail
            on stg_purchaseorderdetail.ProductID = stg_productvendor.ProductID
        left join stg_purchaseorderheader
            on stg_purchaseorderheader.PurchaseOrderID = stg_purchaseorderdetail.PurchaseOrderID
        left join stg_shipmethod
            on stg_shipmethod.ShipMethodID = stg_purchaseorderheader.ShipMethodID
    )

    , create_key as (
        select
            row_number() over(order by businessentityid, purchaseorderid, purchaseorderdetailid, productid, employeeid, ShipMethodID) as sk_purchase
            , *
        from join_purchasing
    )

select * from create_key
