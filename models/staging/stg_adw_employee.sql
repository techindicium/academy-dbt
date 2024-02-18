WITH 
    formatted_employee AS (
        SELECT 
            businessentityid AS employee_id
            , jobtitle AS job_title
            , birthdate AS birth_date
            , gender
            , hiredate AS hire_date
            , vacationhours AS vacation_hours
            , sickleavehours AS sick_leave_hours
            , currentflag AS current_fla
        FROM sap_adw.employee
    )

SELECT *
FROM formatted_employee
