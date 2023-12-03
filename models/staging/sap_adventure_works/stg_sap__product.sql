with
    fonte_product as (
        select
            , cast(productid as int) as productid
            , cast(name as string) as name
            , cast(productnumber as string) as productnumber
            , cast(makeflag as bool) as makeflag
            , cast(finishedgoodsflag as bool) as finishedgoodsflag
            , cast(color as string) as color
            , cast(safetystocklevel as int) as safetystocklevel
            , cast(reorderpoint as int) as reorderpoint
            , cast(standardcost as float) as standardcost
            , cast(listprice as float) as listprice
            , cast(size as string) as size
            , cast(sizeunitmeasurecode as string) as sizeunitmeasurecode
            , cast(weightunitmeasurecode as string) as weightunitmeasurecode
            , cast(weight as float) as weight
            , cast(daystomanufacture as int) as daystomanufacture
            , cast(productline as string) as productline
            , cast(class as string) as class 
            , cast(style as string) as style
            , cast(productsubcategoryid as int) as productsubcategoryid
            , cast(productmodelid as int) as productmodelid
            , cast(sellstartdate as timestamp) as sellstartdate
            , cast(sellenddate as timestamp) as sellenddate
            --, cast(discontinueddate as ) as 
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'product') }}
    )

select *
from fonte_product