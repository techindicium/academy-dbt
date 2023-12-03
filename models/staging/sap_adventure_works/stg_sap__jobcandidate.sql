with
    fonte_jobcandidate as (
        select
            cast(jobcandidateid as int) as jobcandidateid
            , cast(businessentityid as int) as businessentityid
            --, cast(resume as string) as 
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'jobcandidate') }}
    )

select *
from fonte_jobcandidate