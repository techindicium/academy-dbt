with
    sap_adw_address as(
        select
            cast(addressid as int64) as address_id
            ,cast(city as string) as address_city
            ,cast(stateprovinceid as int64) as address_state_province_id
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as address_modified_date
        from {{source('adv_work', 'address')}}
    )

select *
from sap_adw_address