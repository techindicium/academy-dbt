with 
    pessoas as (
        select 
            cast(businessentityid as int) as pessoa_id
            , cast(firstname as string) || ' ' || cast(lastname as string) as nome
        from
            {{ source('sap_adw', 'person') }}
    )
select * from pessoas