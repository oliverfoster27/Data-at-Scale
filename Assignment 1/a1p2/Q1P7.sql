use a1p2;

select start_station_code, count(duration_sec), min(duration_sec), max(duration_sec), avg(duration_sec) from members
group by start_station_code;

select start_station_code, count(duration_sec), min(duration_sec), max(duration_sec), avg(duration_sec) from notmembers
group by start_station_code;
