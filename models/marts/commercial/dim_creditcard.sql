with 
    salesorderheader as (
    select 
        distinct(id_creditcard)
    from {{ref('stg_sap__salesorderhead')}}
    where id_creditcard is not null
)

, creditcard as (
    select *
    from {{ref('stg_sap__creditcard')}}
)

, transformed as (
    select 
        row_number() over (order by salesorderheader.id_creditcard) as creditcard_sk	
        , salesorderheader.id_creditcard
        , creditcard.cardtype
    from salesorderheader 
    left join creditcard on salesorderheader.id_creditcard = creditcard.id_creditcard
)

select *
from transformed