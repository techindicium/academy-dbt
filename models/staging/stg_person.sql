with stg_person as (
    select
        businessentityid
        , title
        , firstname
        , middlename
        , lastname
        , persontype
        , namestyle
        , suffix
        , modifieddate
        , rowguid
        , emailpromotion
    from {{ source('raw-data', 'person') }}
)
select *
from stg_person	