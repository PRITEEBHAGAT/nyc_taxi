with source_payment as (

  select * from payment_types
),

stage_payment as(
select
payment_type_id,
mode
from source_payment
)
select * from stage_payment