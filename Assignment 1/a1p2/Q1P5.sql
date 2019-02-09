use a1p2;

set hivevar:station_code = 6100;

select * from stations where code = '${hivevar:station_code}';

select * from data where start_station_code = '${hivevar:station_code}' or end_station_code = '${hivevar:station_code}';

