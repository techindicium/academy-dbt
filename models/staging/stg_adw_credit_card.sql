WITH 
    formatted_credit_card AS (
        SELECT 
            creditcardid AS credit_card_id
            , cardtype AS card_type
            , cardnumber AS card_number
            , expmonth AS expiration_month
            , expyear AS expiration_year
        FROM sap_adw.creditcard
    )
    
SELECT *
FROM formatted_credit_card
