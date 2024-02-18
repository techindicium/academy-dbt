with
    pessoa as(
        select
            -- ids
            businessentityid as id_entidade_negocio
            -- nomes
            , persontype as tp_pessoa
            , firstname as nm_pessoa
            , middlename as nm_meio
            , lastname as nm_ultimo
            , IFNULL(CONCAT(firstname, ' '), '') || IFNULL(CONCAT(middlename, ' '), '') || lastname as nm_completo
            -- outros
            , emailpromotion
        from{{ source('person','person')}}
    )

select *
from pessoa
