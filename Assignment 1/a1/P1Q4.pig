dataRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Rides' USING PigStorage(',') 
AS (start_date:chararray, start_station_code:chararray, end_date:chararray, end_station_code:chararray, duration_sec:int, is_member:chararray);
data = FILTER dataRaw BY NOT (start_date == 'start_date');

members = FILTER data BY (is_member == '1');
notmembers = FILTER data BY (is_member == '0');

members_group = GROUP members ALL;
members_count = FOREACH members_group GENERATE COUNT(members.start_date);

notmembers_group = GROUP notmembers ALL;
notmembers_count = FOREACH notmembers_group GENERATE COUNT(notmembers.start_date);

DUMP members_count;
DUMP notmembers_count;
