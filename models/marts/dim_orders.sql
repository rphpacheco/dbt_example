with
    selected as (
        select 
            *
        from {{ ref('stg_orders') }}
    )
    ,transformed as (
        select 
            row_number() over (order by id) as sk_orders
            ,customer_id
            ,departament_id
            ,CAST(employee_id as INTEGER) as employee_id
            ,order_type_id
            ,order_date
            ,return_date
            ,order_status
        from selected
    )

select * from transformed