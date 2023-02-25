with
    motivo_venda as (
        select
            cast(salesreasonid as int) as motivo_venda_id
            , cast(name as string) as motivador
            , cast(reasontype as string) as categoria
        from
            {{ source('sap_adw', 'salesreason') }}
    )
select * from motivo_venda