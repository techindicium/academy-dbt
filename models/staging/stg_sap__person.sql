with
    sap_adw_person as (
        select
            cast(businessentityid as int64) as person_business_entity_id
            ,cast(firstname as string) as person_first_name
            ,cast(middlename as string) as person_middle_name
            ,cast(lastname as string) as person_last_name
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as person_modified_date
        from {{source("adv_work", "person")}}
    )

select *
from sap_adw_person