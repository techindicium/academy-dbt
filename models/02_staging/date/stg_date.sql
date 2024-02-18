with
    dimensao_data as (
        {{ dbt_date.get_date_dimension("2010-01-01", "2015-12-31") }}
    )
    
    , dim_data_portugues as(
        select
            dimensao_data.*
            , case
                when dimensao_data.day_of_week_name = "Sunday" or dimensao_data.day_of_week_name = "Saturday" then true
                else false
            end as fl_final_de_semana            
            , case
                when dimensao_data.day_of_week_name = "Sunday" then "Domingo"
                when dimensao_data.day_of_week_name = "Monday" then "Segunda"
                when dimensao_data.day_of_week_name = "Tuesday" then "Terça-Feira"
                when dimensao_data.day_of_week_name = "Wednesday" then "Quarta-Feira"
                when dimensao_data.day_of_week_name = "Thursday" then "Quinta-Feira"
                when dimensao_data.day_of_week_name = "Friday" then "Sexta-Feira"
                when dimensao_data.day_of_week_name = "Saturday" then "Sábado"
            end as nm_dia_semana
            , case
                when dimensao_data.day_of_week_name_short = "Sun" then "Dom"
                when dimensao_data.day_of_week_name_short = "Mon" then "Seg"
                when dimensao_data.day_of_week_name_short = "Tue" then "Ter"
                when dimensao_data.day_of_week_name_short = "Wed" then "Qua"
                when dimensao_data.day_of_week_name_short = "Thu" then "Qui"
                when dimensao_data.day_of_week_name_short = "Fri" then "Sex"
                when dimensao_data.day_of_week_name_short = "Sat" then "Sáb"
            end as nm_dia_semana_abrv
            , case
                when dimensao_data.month_name = "January" then "Janeiro"
                when dimensao_data.month_name = "February" then "Fevereiro"
                when dimensao_data.month_name = "March" then "Março"
                when dimensao_data.month_name = "April" then "Abril"
                when dimensao_data.month_name = "May" then "Maio"
                when dimensao_data.month_name = "June" then "Junho"
                when dimensao_data.month_name = "July" then "Julho"
                when dimensao_data.month_name = "August" then "Agosto"
                when dimensao_data.month_name = "September" then "Setembro"
                when dimensao_data.month_name = "October" then "Outubro"
                when dimensao_data.month_name = "November" then "Novembro"
                when dimensao_data.month_name = "December" then "Dezembro"
            end as nm_mes
            , case
                when dimensao_data.month_name_short = "Jan" then "Jan"
                when dimensao_data.month_name_short = "Feb" then "Fev"
                when dimensao_data.month_name_short = "Mar" then "Mar"
                when dimensao_data.month_name_short = "Apr" then "Abr"
                when dimensao_data.month_name_short = "May" then "Mai"
                when dimensao_data.month_name_short = "Jun" then "Jun"
                when dimensao_data.month_name_short = "Jul" then "Jul"
                when dimensao_data.month_name_short = "Aug" then "Ago"
                when dimensao_data.month_name_short = "Sep" then "Set"
                when dimensao_data.month_name_short = "Oct" then "Out"
                when dimensao_data.month_name_short = "Nov" then "Nov"
                when dimensao_data.month_name_short = "Dec" then "Dez"
            end as nm_mes_abrv            
        from dimensao_data
    )

select *
from dim_data_portugues
