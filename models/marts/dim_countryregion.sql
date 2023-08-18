with 
    Addressdata as (
        select
            ID_Address		
            ,ID_StateProvince		
            ,Address_Line1						
            ,Address_Line2				
            ,City							
            ,Postal_Code				
        from {{ ref('stg_address') }}
    ),

    Statedata as (
        select
            ID_StateProvince
            ,ID_Territory						
            ,CODE_StateProvince			
            ,CODE_ContryRegion	
            ,State_Name		
            ,Is_Only_State_Province_Flag				
        from {{ ref('stg_stateprovince') }}
    ),

    Countrydata as (
        select
            CODE_ContryRegion					
            ,Country_Name		
        from {{ ref('stg_countryregion') }}
    ),

    Joinedregiondata as (
        select
            Addressdata.ID_Address
            ,Statedata.ID_StateProvince
            ,Addressdata.City
            ,Statedata.State_Name
            ,Countrydata.Country_Name
        from Addressdata
        left join Statedata on Addressdata.ID_StateProvince = Statedata.ID_StateProvince
        left join Countrydata on Statedata.CODE_ContryRegion = Countrydata.CODE_ContryRegion
    )

select * 
from Joinedregiondata