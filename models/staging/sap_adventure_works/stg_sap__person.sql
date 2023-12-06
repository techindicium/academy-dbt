with
    fonte_person as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(persontype as string) as persontype
            , cast(namestyle as bool) as namestyle
            , cast(title as string) as title
            , cast(firstname as string) as firstname
            , cast(middlename as string) as middlename
            , cast(lastname as string) as lastname
            , cast(suffix as string) as suffix
            , cast(emailpromotion as int) as emailpromotion
            --, cast(additionalcontactinfo as string) as additionalcontactinfo
            --, cast(demographics as string) as demographics
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'person') }}
    )

select *
from fonte_person