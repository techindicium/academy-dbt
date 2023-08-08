with 
    fact_sales as (
        select
            ID_sales 
            ,ID_order
            ,ID_sales_order_detail
            ,ID_Product
            ,ID_ship_to_address
            ,ID_credit_card
            ,ID_Address
            ,ID_StateProvince
            ,ID_Customer
            ,Customer_Name
            ,Product_Name
            ,ReasonName
            ,CardType
            ,order_date
            ,quantity
            ,price
            ,totaldue
            ,subtotal
            ,taxamt
            ,freight
            ,City
            ,State_Name
            ,Country_Name 
        from {{ ref('int_salescustomerorders') }}
    )

select *
from fact_sales
