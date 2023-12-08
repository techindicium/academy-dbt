with
    stg_person as (
        select *
        from {{ ref('stg_sap__person') }}
    )

    , stg_email as (
        select *
        from {{ ref('stg_sap__emailaddress') }}
    )

    , stg_personphone as (
        select *
        from {{ ref('stg_sap__personphone') }}
    )

    , stg_phonenumber as (
        select *
        from {{ ref('stg_sap__phonenumbertype') }}
    )

    , join_person as (
        select
            stg_person.businessentityid
            , stg_person.persontype
            , stg_person.namestyle
            , stg_person.title
            , stg_person.firstname
            , stg_person.middlename
            , stg_person.lastname
            , stg_person.suffix
            , stg_person.emailpromotion
            --, stg_person.rowguid as rowguid_person
            --, stg_person.modifieddate as modifieddate_person
            , stg_email.emailaddressid
            , stg_email.emailaddresscolumn
            --, stg_email.rowguid as rowguid_email
            --, stg_email.modifieddate as modifieddate_email
            , stg_personphone.phonenumber
            --, stg_personphone.modifieddate as modifieddate_personphone
            , stg_phonenumber.phonenumbertypeid
            , stg_phonenumber.name
        from stg_person
        left join stg_email
            on stg_person.businessentityid = stg_email.businessentityid
        left join stg_personphone
            on stg_person.businessentityid = stg_personphone.businessentityid
        left join stg_phonenumber
            on stg_phonenumber.phonenumbertypeid = stg_personphone.phonenumbertypeid
    )

    , create_key as (
        select
            row_number() over(order by businessentityid, phonenumbertypeid) as sk_person
            , *
        from join_person
    )

select * from create_key
