with 
    source_creditcard as (
        select
            cast(creditcardid as int) as ID_CreditCard			
            ,cast(cardtype as STRING) as CardType	
            ,cast(cardnumber as int) as CardNumber		
            ,cast(expmonth as int) as Exp_Month		
            ,cast(expyear as int) as Exp_Year	
        from {{ source('erp', 'creditcard') }}				
    )
select * 
from source_creditcard