{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH booking AS 
(
    SELECT 
        BOOKING_ID,
        BOOKING_DATE,
        BOOKING_STATUS,
        CREATED_AT
    FROM 
        {{ ref('obt_one_big_table') }}
)
SELECT * FROM booking