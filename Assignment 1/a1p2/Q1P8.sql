use a1p2;

select s.name, count(r.start_station_code) as cnt
from members r join stations s on (r.start_station_code = s.code)
group by r.start_station_code, s.name
order by cnt DESC
limit 5;

select s.name, count(r.start_station_code) as cnt
from notmembers r join stations s on (r.start_station_code = s.code)
group by r.start_station_code, s.name
order by cnt DESC
limit 5;
