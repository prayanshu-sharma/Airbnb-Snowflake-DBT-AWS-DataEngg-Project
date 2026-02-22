{% macro multiple_transformation(column_name,node)%}
    {{ col_name | trim | upper}}
{% endmacro %}