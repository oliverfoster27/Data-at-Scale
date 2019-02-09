dataRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Rides' USING PigStorage(',') 
AS (start_date:chararray, start_station_code:chararray, end_date:chararray, end_station_code:chararray, duration_sec:int, is_member:chararray);
data = FILTER dataRaw BY NOT (start_date == 'start_date');

members = FILTER data BY (is_member == '1');
notmembers = FILTER data BY (is_member == '0');

member_station_cluster = GROUP members by start_station_code;
member_station_desc = FOREACH member_station_cluster GENERATE group, COUNT(members.start_station_code), MIN(members.duration_sec), MAX(members.duration_sec), AVG(members.duration_sec);

notmember_station_cluster = GROUP notmembers by start_station_code;
notmember_station_desc = FOREACH notmember_station_cluster GENERATE group, COUNT(notmembers.start_station_code), MIN(notmembers.duration_sec), MAX(notmembers.duration_sec), AVG(notmembers.duration_sec);

DUMP member_station_desc;
DUMP notmember_station_desc;
