with
    stg_employee as (
        select *
        from {{ ref('stg_sap__employee') }}
    )

    , stg_department as (
        select *
        from {{ ref('stg_sap__department') }}
    )

    , stg_employeedepartmenthistory as (
        select *
        from {{ ref('stg_sap__employeedepartmenthistory') }}
    )

    , stg_shift as (
        select *
        from {{ ref('stg_sap__shift') }}
    )

    , stg_jobcandidate as (
        select *
        from {{ ref('stg_sap__jobcandidate') }}
    )

    , stg_employeepayhistory as (
        select *
        from {{ ref('stg_sap__employeepayhistory') }}
    )

    , join_employee as (
        select
            stg_employee.businessentityid
            , stg_employee.nationalidnumber
            , stg_employee.loginid
            , stg_employee.jobtitle
            , stg_employee.birthdate
            , stg_employee.maritalstatus
            , stg_employee.gender
            , stg_employee.hiredate
            , stg_employee.salariedflag
            , stg_employee.vacationhours
            , stg_employee.sickleavehours
            , stg_employee.currentflag
            , stg_employee.rowguid
            , stg_employee.modifieddate as modifieddate_emp
            , stg_employee.organizationnode
            , stg_employeedepartmenthistory.departmentid
            , stg_employeedepartmenthistory.shiftid
            , stg_employeedepartmenthistory.startdate as startdate_empdepthist
            , stg_employeedepartmenthistory.enddate as enddate_empdepthist
            , stg_employeedepartmenthistory.modifieddate as modifieddate_empdepthist
            , stg_department.name as department_name
            , stg_department.groupname
            , stg_department.modifieddate
            , stg_shift.name as shift_name
            , stg_shift.starttime as starttime_shift
            , stg_shift.endtime as endtime_shift
            , stg_shift.modifieddate as shift_empdepthist
            , stg_jobcandidate.jobcandidateid
            , stg_jobcandidate.modifieddate as modifieddate_jobcand
            , stg_employeepayhistory.ratechangedate
            , stg_employeepayhistory.rate
            , stg_employeepayhistory.payfrequency
            , stg_employeepayhistory.modifieddate as modifieddate_emppayhist
        from stg_employee
        left join stg_employeedepartmenthistory
            on stg_employee.businessentityid = stg_employeedepartmenthistory.businessentityid
        left join stg_jobcandidate
            on stg_employee.businessentityid = stg_jobcandidate.businessentityid
        left join stg_employeepayhistory
            on stg_employee.businessentityid = stg_employeepayhistory.businessentityid
        left join stg_department
            on stg_employeedepartmenthistory.DepartmentID = stg_department.DepartmentID
        left join stg_shift
            on stg_employeedepartmenthistory.ShiftID = stg_shift.ShiftID
    )

    , create_key as (
        select
            row_number() over(order by businessentityid, departmentid, shiftid, jobcandidateid) as sk_employee
            , *
        from join_employee
    )

select * from create_key
