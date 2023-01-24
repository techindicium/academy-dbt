with
    source_person as (
        select
            cast( businessentityid as int) as id_business_entity
            , cast(title as string) as title
            , cast(firstname as string) as first_name
            , cast(middlename as string) as middle_name
            , cast(lastname as string) as last_name
            , case
                when middlename is not null then firstname || ' ' || middlename || ' ' || lastname
                else firstname || ' ' || lastname
            end as full_name
            , cast(persontype as string) as person_type
            , cast(namestyle as string) as name_style
            , cast(suffix as string) as suffix
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
            , cast(rowguid as string) as row_guid	
            , cast(emailpromotion as string) as email_promotion
        from {{ source('adw', 'person' ) }}
    )

select *
from source_person
