with
    fonte_businessentitycontact as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(personid as int) as personid
            , cast(contacttypeid as int) as contacttypeid
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'businessentitycontact') }}
    )

select *
from fonte_businessentitycontact