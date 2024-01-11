with source as (

    select 
        businessentityid
        , persontype
        , namestyle
        , firstname
        , lastname
    
    from {{ source('person', 'person_person') }}
)

select * from source