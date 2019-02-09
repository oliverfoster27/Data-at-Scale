use a1p2;

select start_station_code, count(*) as cnt from data
group by start_station_code
order by cnt DESC;

