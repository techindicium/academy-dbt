with
    cliente as(
        select
            -- ids
            customerid as id_cliente
            , personid as id_pessoa
            , storeid as id_loja
            , territoryid as id_territorio
        from{{ source('sales','customer')}}
    )

select *
from cliente
