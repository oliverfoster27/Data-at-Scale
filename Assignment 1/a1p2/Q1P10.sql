use a1p2;

set hive.enforce.bucketing = true;
set hive.enforce.sorting=true;
set hive.exec.dynamic.partition = true;
set hive.exec.dynamic.partition.mode = nonstrict;

create table data_part (
start_date string,
start_station_code string,
end_date string,
end_station_code string,
duration_sec int)
partitioned by (is_member tinyint)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;

insert into data_part partition (is_member)
	select start_date string, start_station_code string, end_date string, end_station_code string, duration_sec int, is_member tinyint
	from data;
