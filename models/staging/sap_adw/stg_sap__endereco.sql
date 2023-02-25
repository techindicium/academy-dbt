with
    enderecos as (
        select
            cast(addressid as int) as endereco_id
            , cast(addressline1 as string) as endereco_parte1
            , cast(addressline2 as string) as endereco_parte2
            , cast(city as string) as cidade
            , cast(stateprovinceid as int) as estado_id
        from {{ source('sap_adw', 'address') }}
    )
select * from enderecos