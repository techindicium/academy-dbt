with 
    source_department as (
        select * 
        from {{ source('erp', 'department') }}
    )

select * from source_department