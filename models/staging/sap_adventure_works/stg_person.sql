with 
    souce_person as (
        select
            cast(businessentityid as int) as ID_BusinessEntity				
            ,cast(persontype as STRING) as 	PersonTypoe			
            ,cast(namestyle as BOOLEAN) as NameStyle		
            ,cast(title as STRING) as Title			
            ,cast(firstname as STRING) as FirtName				
            ,cast(middlename as STRING) as 	MiddleName				
            ,cast(lastname as STRING) as LastName				
            ,cast(suffix as STRING) as 	Suffix			
            ,cast(emailpromotion as int) as email_Promotion			
            ,cast(additionalcontactinfo as STRING) as Additional_Contact_Info				
            ,cast(demographics as STRING) as Demographics			
            ,cast(rowguid as STRING) as Row_Guid					
        from {{ source('erp', 'person') }}
    )
select * 
from souce_person