with 
    intermediate_orders as (
        select
            ID_order					
            ,ID_sales_order_detail					
            ,ID_orderproduct		
            ,ID_ship_to_address
            ,ID_credit_card
            ,ID_customer_order			
            ,order_date				
            ,quantity					
            ,price					
            ,totaldue					
            ,subtotal					
            ,taxamt					
            ,freight		
        from {{ ref('dim_orders') }}
    ),

    intermediate_country_region as (
        select
            ID_Address						
            ,ID_StateProvince						
            ,City						
            ,State_Name					
            ,Country_Name		
        from {{ ref('dim_countryregion') }}	
    ),

    intermediate_creditcard as (
        select
            ID_CreditCard					
            ,CardType					
            ,CardNumber					
        from {{ ref('dim_creditcard') }}	
    ),

    intermediate_customer as (
        select
            ID_Customer				
            ,ID_Person				
            ,ID_BusinessEntity				
            ,PersonTypoe				
            ,FirtName				
            ,LastName				
        from {{ ref('dim_customer') }}
    ),

    intermediate_product as (
        select
            ID_Product				
            ,Product_Name				
            ,Product_Number				
            ,Standard_Cost				
            ,List_price				
            ,Product_Class
        from {{ ref('dim_product') }}
    ),
    intermediate_salesreason as (
        select
            ID_SalesOrder					
            ,ID_SalesReason					
            ,ReasonName					
            ,ReasonType											
        from {{ ref('dim_salesreason') }}
    ), 

    joined_tables as (
        select 
            ID_order
            ,ID_sales_order_detail
            ,ID_Product
            ,ID_ship_to_address
            ,ID_credit_card
            ,ID_Address
            ,ID_StateProvince
            ,ID_SalesReason
            ,ID_Customer
            ,FirtName
            ,LastName
            ,Product_Name
            ,ReasonName
            ,ReasonType
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
        from intermediate_orders
        left join intermediate_country_region on intermediate_orders.ID_ship_to_address = intermediate_country_region.ID_Address
        left join intermediate_creditcard on intermediate_orders.ID_credit_card = intermediate_creditcard.ID_CreditCard
        left join intermediate_customer on intermediate_orders.ID_customer_order = intermediate_customer.ID_Customer
        left join intermediate_product on intermediate_orders.ID_orderproduct = intermediate_product.ID_Product
        left join intermediate_salesreason on intermediate_orders.ID_order = intermediate_salesreason.ID_SalesOrder
    )


select * 
from joined_tables
