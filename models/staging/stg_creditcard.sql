with stg_creditcard as (
    select
        creditcardid
        , cardnumber
        , cardtype
        , modifieddate
        , expmonth
        , expyear
    from {{ source('raw-data', 'creditcard') }}
)
select *
from stg_creditcard