with 
    stg_credit_card as (
        select *
        from {{ ref('stg_sap__credit_card') }}
    )

 
    , transformed as (
        select 
            id_credit_card
            , card_type
            , expired_year
            , expired_month
            , card_number
            , modified_date
        from stg_credit_card 
    )

select *
from transformed