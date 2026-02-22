{% set cols =['Nights_Booked','BOOKING_ID','BOOKING_AMOUNT'] %}

select 
{% for col in cols %}
        {{col }}
        {% if not loop.last %},{% endif%}
{% endfor %}
from {{ref('booking_dbtschema')}}