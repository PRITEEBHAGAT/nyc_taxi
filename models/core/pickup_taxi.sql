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
        coordinate.longitude as pickup_longitude,
        coordinate.latitude as pickup_latitude,
        coordinate.region_code as pickup_region_code,
        coordinate.region as pickup_region,
        coordinate.country_code as pickup_country_code,
        coordinate.country_name as pickup_country_name,
        payment.mode as payment_mode,
        zone.zone as pickup_zone,
        zone.service_zone as pickup_service_zone,
        zone.borough as pickup_borough,
        case
            taxi.vendor_id
            when 1 then 'Creative Mobile Technologies LLC'
            else 'VeriFone Inc'
        end
            as vendor_name,
            taxi.trip_id,
            taxi.vendor_id,
            taxi.pu_location_id,
            taxi.do_location_id,
            taxi.tpep_pickup_datetime
            from taxi
            inner join coordinate on coordinate.location_id=  taxi.pu_location_id
            inner join zone on zone.location_id = taxi.pu_location_id
            inner join payment on payment.payment_type_id = taxi.payment_type_id



)
select * from final