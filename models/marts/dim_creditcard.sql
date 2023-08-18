with 
    Credit_Card as (
        select * 
        from {{ ref('stg_creditcard') }}
    )
    
select * 
from Credit_Card