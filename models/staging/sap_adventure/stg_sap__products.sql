with
    source_product as (
        select
            cast(productid as int) id_product
            , cast(productmodelid as int) id_productmodel
            , cast(productsubcategoryid as int) as id_product_subcategory
            , cast(name as string) as name_product
            , cast(productnumber as string) as number_product
            , cast(makeflag as boolean) as makeflag
            , cast(finishedgoodsflag as boolean) as finishedgoodsflag	
            , cast(color as string) as color
            , cast(safetystocklevel	as int) as 	safetystocklevel
            , cast(reorderpoint	as int) as reorderpoint
            , cast(standardcost	as float64) as standardcost
            , cast(listprice as float64) as pricelist
            , cast(size as string) as numbersize
            , cast(sizeunitmeasurecode as string) as unitmesure
            , cast(weightunitmeasurecode as string) as weigh_unitmensure			
            , cast(weight as float64) as weight
            , cast(daystomanufacture as int) as days_tomanufacture		
            , cast(productline as string) as productline			
            , cast(class as string) as class				
            , cast(style as string) as style				
            , cast(sellstartdate as TIMESTAMP) as start_selldate			
            , cast(sellenddate as TIMESTAMP) as end_selldate				
            , cast(rowguid as string) as rowguid			
            , cast(modifieddate as TIMESTAMP) as date_modificed
        from {{source('adw', 'product' )}}
    )
    select *
    from source_product