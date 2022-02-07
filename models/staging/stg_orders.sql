with
    source as (
        select 
            id
            ,customer_id
            ,departament_id
            ,employee_id
            ,order_type_id
            ,order_date
            ,return_date
            ,case
                when order_status = 'pending' then 'pendente'
                when order_status = 'shipped' then 'enviado'
                when order_status = 'delayed' then 'atrasado'
                when order_status = 'on hold' then 'em espera'
                else order_status
            end as order_status
        from {{ source('public','orders') }}
    )

select * from source