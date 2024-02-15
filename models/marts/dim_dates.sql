with
    date_series as (
        {{ dbt_utils.date_spine(
            datepart="day",
            start_date="cast('1900-01-01' as date)",
            end_date="date_add(current_date, interval 1 year)"
        )
        }}
    )

    , date_columns as (
        select distinct
            cast(date_day as date) as metric_date
            , extract(day from date_day) as day_of_month
            , extract(month from date_day) as month
            , extract(year from date_day) as year
            , extract(quarter from date_day) as quarter
            , extract(dayofyear from date_day) as dayofyear
            , extract(week from date_day) as iso_week
            , case
                when
                    extract(day from date_day) != 1 and extract(dayofweek from date_day) = 1
                    then extract(week from date_day)-1
                else extract(week from date_day)
            end as week
            , case
                when extract(dayofweek from date_day) = 1 then 'Domingo'
                when extract(dayofweek from date_day) = 2 then 'Segunda-Feira'
                when extract(dayofweek from date_day) = 3 then 'Terça-Feira'
                when extract(dayofweek from date_day) = 4 then 'Quarta-Feira'
                when extract(dayofweek from date_day) = 5 then 'Quinta-Feira'
                when extract(dayofweek from date_day) = 6 then 'Sexta-Feira'
                when extract(dayofweek from date_day) = 7 then 'Sábado'
            end as dayofweek
            , case
                when extract(month from date_day) = 1 then 'Janeiro'
                when extract(month from date_day) = 2 then 'Fevereiro'
                when extract(month from date_day) = 3 then 'Março'
                when extract(month from date_day) = 4 then 'Abril'
                when extract(month from date_day) = 5 then 'Maio'
                when extract(month from date_day) = 6 then 'Junho'
                when extract(month from date_day) = 7 then 'Julho'
                when extract(month from date_day) = 8 then 'Agosto'
                when extract(month from date_day) = 9 then 'Setembro'
                when extract(month from date_day) = 10 then 'Outubro'
                when extract(month from date_day) = 11 then 'Novembto'
                when extract(month from date_day) = 12 then 'Dezembro'
            end as fullmonth
        from date_series
    )

    , transformed as (
        select
            *
            , concat('W', cast(week as string), '-', cast(year as string)) as week_year
        from date_columns
    )

select *
from transformed