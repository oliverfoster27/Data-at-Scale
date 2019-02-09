stationsRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Stations_2017.csv' USING PigStorage(',')
AS (code:chararray, name:chararray, latitude:double, longitude:double);
stations = FILTER stationsRaw BY NOT (code == 'code');

dataRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Rides' USING PigStorage(',') 
AS (start_date:chararray, start_station_code:chararray, end_date:chararray, end_station_code:chararray, duration_sec:int, is_member:chararray);
data = FILTER dataRaw BY NOT (start_date == 'start_date');

data_join = JOIN data BY start_station_code, stations BY code;

members = FILTER data_join BY (is_member == '1');
notmembers = FILTER data_join BY (is_member == '0');

members_cluster = GROUP members by name;
members_count = FOREACH members_cluster GENERATE group, COUNT(members.start_station_code) as cnt;

notmembers_cluster = GROUP notmembers by name;
notmembers_count = FOREACH notmembers_cluster GENERATE group, COUNT(notmembers.start_station_code) as cnt;

members_count_ordered = ORDER members_count BY cnt DESC;
notmembers_count_ordered = ORDER notmembers_count BY cnt DESC;

lim_members_count = LIMIT members_count_ordered 5;
lim_notmembers_count = LIMIT notmembers_count_ordered 5;

DUMP lim_members_count;
DUMP lim_notmembers_count;
