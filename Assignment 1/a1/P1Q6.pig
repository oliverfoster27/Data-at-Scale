dataRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Rides' USING PigStorage(',') 
AS (start_date:chararray, start_station_code:chararray, end_date:chararray, end_station_code:chararray, duration_sec:int, is_member:chararray);
data = FILTER dataRaw BY NOT (start_date == 'start_date');

station_cluster = GROUP data by start_station_code;
station_count = FOREACH station_cluster GENERATE FLATTEN(group) as start_station_code, COUNT($1);

DUMP station_count;
