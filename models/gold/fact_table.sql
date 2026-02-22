{% set congigs = [
    {
        "table" : "AIRBNB.gold.obt_one_big_table",
        "columns" : "gold_obt_one_big_table.BOOKING_ID, gold_obt_one_big_table.LISTING_ID, gold_obt_one_big_table.HOST_ID,gold_obt_one_big_table.TOTAL_AMOUNT, gold_obt_one_big_table.SERVICE_FEE, gold_obt_one_big_table.CLEANING_FEE, gold_obt_one_big_table.ACCOMMODATES, gold_obt_one_big_table.BEDROOMS, gold_obt_one_big_table.BATHROOMS, gold_obt_one_big_table.PRICE_PER_NIGHT, gold_obt_one_big_table.RESPONSE_RATE",
        "alias" : "gold_obt_one_big_table"
    },
    { 
        "table" : "AIRBNB.gold.dim_listings",
        "columns" : "",
        "alias" : "dim_listing",
        "join_condition" : "gold_obt_one_big_table.listing_id = dim_listing.listing_id"
    },
    {
        "table" : "AIRBNB.gold.dim_hosts",
        "columns" : "",
        "alias" : "dim_host",
        "join_condition" : "gold_obt_one_big_table.host_id = dim_host.host_id"
    }
] %}



SELECT 
        {{ congigs[0]['columns'] }}

FROM
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}