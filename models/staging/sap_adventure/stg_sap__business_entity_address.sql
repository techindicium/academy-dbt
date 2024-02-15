with
    source_businessentityaddress as (
        select
            cast(addressid as int) as id_address
            , cast(businessentityid as int) as id_business_entity
            , addresstypeid as id_address_type
        from {{ source('adw', 'businessentityaddress') }}     
    )

select *
from source_businessentityaddress