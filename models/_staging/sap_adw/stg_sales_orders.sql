-- Model Name: stg_sales_orders
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH salesorderdetail AS (
    SELECT * FROM {{ ref("salesorderdetail") }}
),

salesorderheader AS (
    SELECT * FROM {{ ref("salesorderheader") }}
),

final AS (
    SELECT
        sod.salesorderdetailid AS int_sales_order_detail_id,
        sod.carriertrackingnumber AS str_carrier_trabking_number,
        sod.orderqty AS int_order_qty,
        sod.productid AS int_product_id,
        sod.specialofferid AS int_special_offer_id,
        sod.unitprice AS int_unit_price,
        sod.unitpricediscount AS int_unit_price_discount,
        soh.salesorderid AS int_sales_order_id,
        soh.revisionnumber AS int_revision_number,
        DATE(soh.orderdate) AS dte_order_date,
        DATE(soh.duedate) AS dte_due_date,
        DATE(soh.shipdate) AS dte_ship_date,
        soh.status AS int_status,
        soh.onlineorderflag AS bol_online_order_flag,
        soh.purchaseordernumber AS str_purchase_order_number,
        soh.accountnumber AS str_account_number,
        soh.customerid AS int_customer_id,
        soh.salespersonid AS int_people_id,
        soh.territoryid AS int_territory_id,
        soh.billtoaddressid AS int_bill_to_address_id,
        soh.shiptoaddressid AS int_ship_to_address_id,
        soh.shipmethodid AS int_ship_method_id,
        soh.creditcardid AS int_credit_card_id,
        soh.creditcardapprovalcode AS int_credit_card_approval_code,
        soh.currencyrateid AS int_currency_rate_id,
        soh.subtotal AS flt_subtotal,
        soh.taxamt AS flt_tax_amt,
        soh.freight AS flt_freight,
        soh.totaldue AS flt_total_due,
        soh.comment AS int_comment,
        soh.rowguid AS str_rowguid,
        DATE(sod.modifieddate) AS dte_sales_order_detail_modified_date,
        DATE(soh.modifieddate) AS dte_sales_order_header_modified_date
    FROM salesorderdetail AS sod
    LEFT JOIN salesorderheader AS soh ON soh.salesorderid = sod.salesorderid    
)

SELECT * FROM final
