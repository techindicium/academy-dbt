with
    source_vendor as (
        select
            cast(businessentityid as int) as id_business_entity
            , cast(accountnumber as string) as account_number
            , cast(name as string) as name
            , cast(creditrating as int) as credit_rating
            , cast(preferredvendorstatus as string) as preferred_vendor_status
            , cast(activeflag as boolean) as active_flag
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'vendor' )}}
    )
select *
from source_vendor