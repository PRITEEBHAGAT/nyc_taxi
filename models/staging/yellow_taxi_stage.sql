with source_data as (

  select * from yellow_taxi_trip
),

stage_taxi as(
select
trip_id,
vendor_id,
pu_location_id,
do_location_id,
tpep_pickup_datetime,
tpep_dropoff_datetime,
payment_type_id
from source_data
)
select * from stage_taxi