{% set nights_booked=1 %}

select * from {{ref('booking_dbtschema')}} 
where Nights_Booked > {{nights_booked}}



