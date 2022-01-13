with source_zone as (

  select * from zone
),

stage_zone as(
select
location_id,
borough,
zone,
service_zone
from source_zone
)
select * from stage_zone