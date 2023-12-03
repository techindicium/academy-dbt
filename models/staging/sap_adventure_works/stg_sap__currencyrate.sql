with
    fonte_currencyrate as (
        select *
            cast(currencyrateid as int) as currencyrateid
            , cast(currencyratedate as timestamp) as currencyratedate
            , cast(fromcurrencycode as string) as fromcurrencycode
            , cast(tocurrencycode as string) as tocurrencycode
            , cast(averagerate as float) as averagerate 
            , cast(endofdayrate as float) as endofdayrate
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'currencyrate') }}
    )

select *
from fonte_currencyrate