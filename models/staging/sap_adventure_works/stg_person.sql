with 
    souce_person as (
        select
            cast(businessentityid as int) as ID_business_entity				
            ,cast(firstname as STRING) as firt_name				
            ,cast(middlename as STRING) as 	middle_name				
            ,cast(lastname as STRING) as last_name				
        from {{ source('erp', 'person') }}
    )
    
select * 
from souce_person
