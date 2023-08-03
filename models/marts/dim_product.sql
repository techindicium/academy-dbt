with 
    dim_product as (
        select * 
        from {{ ref('sgt_product') }}
    )
select * 
from dim_product