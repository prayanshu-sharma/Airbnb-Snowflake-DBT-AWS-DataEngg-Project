{{ config(
    severity='warn') }}

select 1
from 
{{ source('staging','BOOKINGS')}}
where 
booking_amount <0