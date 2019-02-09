dataRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Rides' USING PigStorage(',') 
AS (start_date:chararray, start_station_code:chararray, end_date:chararray, end_station_code:chararray, duration_sec:int, is_member:chararray);
data = FILTER dataRaw BY NOT (start_date == 'start_date');
stationsRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Stations_2017.csv' USING PigStorage(',')
AS (code:chararray, name:chararray, latitude:double, longitude:double);
stations = FILTER stationsRaw BY NOT (code == 'code');
