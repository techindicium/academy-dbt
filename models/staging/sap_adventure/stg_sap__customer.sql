with
    source_customer as (
        select
            cast(customerid as int) as id_customer
            , cast(personid as int) as id_person
            , cast(storeid as int) as id_store
            , cast(territoryid as int) as id_territory
        from {{source('adw', 'customer' )}}
    )

select *
from source_customer