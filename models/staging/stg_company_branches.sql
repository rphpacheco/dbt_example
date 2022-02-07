with
    source as (
        select 
            id
            ,country_code
            ,country
            ,state
            ,city
            ,name
            ,latitude
            ,longitude
            ,phone
        from {{ source('public','company_branches') }}
    )

select * from source