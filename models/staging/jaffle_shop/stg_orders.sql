select

    row_number() over (
        partition by user_id 
        order by order_date, id
    ) as user_order_seq,
    id as order_id,
    user_id as customer_id,
    order_date as order_placed_at,
    status as order_status,
    _etl_loaded_at

from {{ source('jaffle_shop', 'orders') }}