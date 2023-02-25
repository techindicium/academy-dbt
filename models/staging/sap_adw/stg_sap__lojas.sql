with
    loja as (
        select 
            cast(businessentityid as int) as loja_id
            , cast(name as string) as nome_loja
            , cast(salespersonid as int) as vendedor_id
        from {{ source('sap_adw', 'store') }}
    )
select * from loja