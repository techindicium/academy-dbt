with
    fonte_purchaseorderdetail as (
        select
            cast(purchaseorderid as int) as purchaseorderid
            , cast(purchaseorderdetailid as int) as purchaseorderdetailid
            , cast(duedate as timestamp) as duedate
            , cast(orderqty as int) as orderqty
            , cast(productid as int) as productid
            , cast(unitprice as float) as unitprice
            , cast(receivedqty as int) as receivedqty
            , cast(rejectedqty as int) as rejectedqty
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'purchaseorderdetail') }}
    )

select *
from fonte_purchaseorderdetail