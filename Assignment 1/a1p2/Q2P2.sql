invalidate metadata;

use a1p2;

select s1.name as start_station, s2.name as end_station,
  2 * asin(
      sqrt(
        cos(radians(s1.latitude)) *
        cos(radians(s2.latitude)) *
        pow(sin(radians((s1.longitude - s2.longitude)/2)), 2)
            +
        pow(sin(radians((s1.latitude - s2.latitude)/2)), 2)

      )
    ) * 6371 as distance_km
from `data` r 
join stations s1 on (r.start_station_code = s1.code)
join stations s2 on (r.end_station_code = s2.code)
order by distance_km DESC
limit 1;

select s1.name as start_station, s2.name as end_station,
  2 * asin(
      sqrt(
        cos(radians(s1.latitude)) *
        cos(radians(s2.latitude)) *
        pow(sin(radians((s1.longitude - s2.longitude)/2)), 2)
            +
        pow(sin(radians((s1.latitude - s2.latitude)/2)), 2)

      )
    ) * 6371 as distance_km
from `data` r 
join stations s1 on (r.start_station_code = s1.code)
join stations s2 on (r.end_station_code = s2.code)
order by distance_km ASC
limit 1;
