with
    order_items as (
        select 
            *
        from {{ ref('dim_order_items') }}
    ),
    employees as (
        select 
            *
        from {{ ref('dim_employees') }}
    ),
    company_branches as (
        select 
            *
        from {{ ref('dim_company_branches') }}
    ),
    orders as (
        select 
            orders.sk_orders
            ,order_items.sk_order_items
            ,employees.sk_employees
            ,company_branches.sk_company_branches
            ,orders.customer_id
            ,orders.departament_id
            ,orders.order_date
            ,orders.return_date
            ,orders.order_status
        from {{ ref('dim_orders') }} as orders
        left join order_items on orders.order_type_id = order_items.id
        left join employees on orders.employee_id = employees.id
        left join company_branches on employees.company_branches_id = company_branches.id
    )

select * from orders