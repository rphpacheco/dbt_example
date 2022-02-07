with
    source as (
        select 
            id
            ,departament_id
            ,company_branches_id
            ,case 
                when departament = 'salesman' then 'vendedor'
                when departament = 'mecanic' then 'mecânico'
                when departament = 'sales coordinator' then 'coordenador de vendas'
                when departament = 'technical' then 'técnico'
                when departament = 'sales director' then 'diretor de vendas'
                when departament = 'technical manager' then 'gerente técnico'
                else departament
            end as departament
            ,first_name
            ,last_name
            ,gender
            ,email
        from {{ source('public','employees') }}
    )

select * from source