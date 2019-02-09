invalidate metadata;

use a1p2;

with total as (select count(*) as total from `data`)
select r.start_station_code, s.name, count(r.start_station_code) as rides, count(r.start_station_code)/total.total*100 as perc from `data` r, total
join stations s on (r.start_station_code = s.code)
group by r.start_station_code, total.total, s.name 
order by rides DESC
limit 5;

with total as (select count(*) as total from `data`)
select r.end_station_code, s.name, count(r.end_station_code) as rides, count(r.end_station_code)/total.total*100 as perc from `data` r, total
join stations s on (r.end_station_code = s.code)
group by r.end_station_code, total.total, s.name 
order by rides DESC
limit 5;
