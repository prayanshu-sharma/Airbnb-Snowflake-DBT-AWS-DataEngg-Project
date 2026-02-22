{% set flag=1 %}
select * from {{ref('booking_dbtschema')}} 
{% if flag==1 %}
   where Nights_Booked>1
{% else %}
   where Nights_Booked=1
{% endif %}