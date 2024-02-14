WITH 
    source_address AS (
        SELECT *
        FROM {{ source('sap_adw', 'address') }}    
    ),
    
    formatted_address as (
        select 
            addressid as address_id
           , stateprovinceid as state_province_id
           , addressline1 as address_line
           , city
        from source_address  
    )

select *
from formatted_address
