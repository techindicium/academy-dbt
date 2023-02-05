-- Model Name: stg_people
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH person AS (
    SELECT * FROM {{ ref("person") }}
),

final AS (
    SELECT
        businessentityid AS int_people_id,
        persontype AS str_person_type,
        namestyle AS bol_name_style,
        title AS str_title,
        firstname AS str_first_name,
        middlename AS str_middle_name,
        lastname AS str_last_name,
        suffix AS str_suffix,
        emailpromotion AS int_email_promotion,
        IF(additionalcontactinfo = '[NULL]', NULL, additionalcontactinfo) AS str_additional_contact_info,
        demographics AS str_demographics,
        rowguid AS str_rowguid,
        DATE(modifieddate) AS dte_modified_date
    FROM person
)

SELECT * FROM final
