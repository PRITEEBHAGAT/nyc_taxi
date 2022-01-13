{{
  config(
    materialized = "table",
  )
}}
with drop1 as (

  select * from {{ ref ('drop_taxi')}}
),
pickup as (

  select * from {{ ref ('pickup_taxi')}}
),
final as(
    select
            pickup.trip_id,
            pickup.pickup_longitude,
            pickup.pickup_latitude,
            pickup.pickup_region_code,
            pickup.pickup_region,
            pickup.pickup_country_code,
            pickup.pickup_country_name,
            pickup.payment_mode,
            pickup.pickup_zone,
            pickup.pickup_service_zone,
            pickup.pickup_borough,
            pickup.vendor_name,
            pickup.vendor_id,
            pickup.pu_location_id,
            pickup.do_location_id,
            pickup.tpep_pickup_datetime,

            drop1.drop_longitude,
            drop1.drop_latitude,
            drop1.drop_region_code,
            drop1.drop_region,
            drop1.drop_country_code,
            drop1.drop_country_name,
            drop1.drop_zone,
            drop1.drop_service_zone,
            drop1.drop_borough,
            drop1.tpep_dropoff_datetime

            from pickup
            inner join drop1 on drop1.trip_id= pickup.trip_id




)
select * from final