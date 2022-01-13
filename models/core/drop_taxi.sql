with coordinate as (

  select * from {{ ref ('coordinate_stage')}}
),
payment as (

  select * from {{ ref ('payment_stage')}}
),

zone as (

  select * from {{ ref ('zone_stage')}}
),
taxi as (
select * from {{ ref ('yellow_taxi_stage')}}

),
final as(
    select
        coordinate.longitude as drop_longitude,
        coordinate.latitude as drop_latitude,
        coordinate.region_code as drop_region_code,
        coordinate.region as drop_region,
        coordinate.country_code as drop_country_code,
        coordinate.country_name as drop_country_name,
        zone.zone as drop_zone,
        zone.service_zone as drop_service_zone,
        zone.borough as drop_borough,
        taxi.trip_id,
        taxi.tpep_dropoff_datetime
        from taxi
            inner join coordinate on coordinate.location_id=  taxi.do_location_id
            inner join zone on zone.location_id = taxi.do_location_id



)
select * from final