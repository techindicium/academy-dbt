with stg_customer as (
    select 
        customerid
        , personid
        , storeid
    from {{ref('stg_customer')}}
)

, stg_person as (
    select
        businessentityid
        , concat(ifnull(firstname,' '),' ',ifnull(middlename,' '),' ',ifnull(lastname,' ')) as fullname
    from {{ref('stg_person')}}
)

, stg_store as (
    select
        businessentityid as storebusinessentityid
        , storename
    from {{ref('stg_store')}}
)

, customer_transformed as (
    select
        row_number() over (order by stg_customer.customerid) as customer_sk, -- auto-incremental surrogate key    
        stg_customer.customerid
        , stg_person.businessentityid
        , stg_person.fullname
        , stg_store.storebusinessentityid
        , stg_store.storename
        , coalesce(stg_person.fullname, stg_store.storename) as customer_fullname
    from stg_customer
    left join stg_person 
        on stg_customer.personid = stg_person.businessentityid
    left join stg_store 
        on stg_customer.storeid = stg_store.storebusinessentityid
)
select *
from customer_transformed

