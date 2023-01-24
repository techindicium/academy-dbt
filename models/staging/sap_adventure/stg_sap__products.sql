with
    source_product as (
        select
            cast(productid as int) id_product
            , cast(productmodelid as int) id_product_model
            , cast(productsubcategoryid as int) as id_product_sub_category
            , cast(name as string) as name_product
            , cast(productnumber as string) as number_product
            , cast(makeflag as boolean) as make_flag
            , cast(finishedgoodsflag as boolean) as finished_goods_flag	
            , cast(color as string) as color
            , cast(safetystocklevel	as int) as 	safety_stock_level
            , cast(reorderpoint	as int) as reorder_point
            , cast(standardcost	as float64) as standard_cost
            , cast(listprice as float64) as price_list
            , cast(size as string) as number_size
            , cast(sizeunitmeasurecode as string) as unit_mesure
            , cast(weightunitmeasurecode as string) as weigh_unit_mensure			
            , cast(weight as float64) as weight
            , cast(daystomanufacture as int) as days_to_manufacture		
            , cast(productline as string) as product_line			
            , cast(class as string) as class				
            , cast(style as string) as style				
            , cast(left(cast(sellstartdate as string), 10) as date) as start_sell_date			
            , cast(left(cast(sellenddate as string), 10) as date) as end_sell_date				
            , cast(rowguid as string) as row_guid			
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'stg_sap__products' )}}
    )
select *
from source_product