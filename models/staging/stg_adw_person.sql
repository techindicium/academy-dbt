WITH 
    source_person AS (
        SELECT *
        FROM {{ source('sap_adw', 'person') }}
    )

    , formatted_person AS (
        SELECT
            businessentityid AS person_id
            , firstname || ' ' || COALESCE(middlename || ' ', '') || lastname AS person_name
            , persontype AS person_type,
            CASE persontype
                WHEN 'SC' THEN 'Store Contact'
                WHEN 'VC' THEN 'Vendor Contact'
                WHEN 'GC' THEN 'General Contact'
                WHEN 'IN' THEN 'Individual Customer'
                WHEN 'SP' THEN 'Sales Person'
                WHEN 'EM' THEN 'Employee'
                ELSE persontype
            END AS person_type_description
        FROM source_person
    )

SELECT *
FROM formatted_person
