with stg_products as (
    select
        CAST(productid AS INT) AS productid
        , name as name_product
        , productnumber
        , rowguid
        , productmodelid
        , safetystocklevel
        , finishedgoodsflag
        , class
        , makeflag
        , reorderpoint
        , modifieddate
        , weightunitmeasurecode
        , standardcost
        , productsubcategoryid
        , listprice
        , daystomanufacture
        , productline
        , color
        , sellstartdate
        , weight as product_weight
    from {{ source('raw-data', 'product') }}
)

select *
from stg_products
