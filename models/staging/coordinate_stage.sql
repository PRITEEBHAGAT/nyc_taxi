with source_data as (

  select * from coordinates
),

stage_coordinate as(
select
coordinate_id,
location_id,
region,
region_code,
country_name,
country_code,
latitude,
longitude
from source_data
)
select * from stage_coordinate