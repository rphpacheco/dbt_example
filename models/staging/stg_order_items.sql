with
    source as (
        select 
            id
            ,order_id
            ,order_type_id
            ,split_part(item, '@~|~@', 1) as manufacturer
            ,split_part(item, '@~|~@', 2) as vehicle
            ,split_part(item, '@~|~@', 3) as year_manufacture
            ,split_part(item, '@~|~@', 4) as color
            ,split_part(item, '@~|~@', 5) as status
            ,split_part(item, '@~|~@', 6) as price
            ,(length(item) - length(replace(item, '@~|~@', ''))) as occurrences
        from {{ source('public','order_items') }}
    )

select * from source where occurrences = 25