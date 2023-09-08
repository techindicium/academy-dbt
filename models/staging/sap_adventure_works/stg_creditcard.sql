with 
    source_creditcard as (
        select
            cast(creditcardid as int) as ID_credit_card			
            ,cast(cardtype as STRING) as card_type	
            ,cast(cardnumber as int) as card_number		
        from {{ source('erp', 'creditcard') }}				
    )
    
select * 
from source_creditcard