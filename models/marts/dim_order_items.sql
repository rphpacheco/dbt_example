with
    selected as (
        select 
            *
        from {{ ref('stg_order_items') }}
    )
    ,transformed as (
        select 
            row_number() over (order by id) as sk_order_items
            ,id
            ,order_type_id
            ,manufacturer
            ,vehicle
            ,year_manufacture
            ,color
            ,status
            ,price
            ,occurrences
        from selected
    )

select * from transformed