with
    selected as (
        select 
            *
        from {{ ref('stg_employees') }}
    )
    ,transformed as (
        select 
            row_number() over (order by id) as sk_employees
            ,id
            ,departament_id
            ,company_branches_id
            ,departament
            ,first_name
            ,last_name
            ,gender
            ,email
        from selected
    )

select * from transformed