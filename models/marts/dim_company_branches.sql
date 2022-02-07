with
    selected as (
        select 
            *
        from {{ ref('stg_company_branches') }}
    )
    ,transformed as (
        select 
            row_number() over (order by id) as sk_company_branches
            ,id
            ,country_code
            ,country
            ,state
            ,city
            ,name
            ,latitude
            ,longitude
            ,phone
        from selected
    )

select * from transformed