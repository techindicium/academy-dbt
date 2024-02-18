with
    funcionarios as (
        select
            -- ids
            businessentityid as id_entidade_negocio
            , loginid as id_login_funcionario
        from{{ source('human_resources','employee')}}
    )

select *
from funcionarios
