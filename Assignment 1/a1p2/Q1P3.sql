use a1p2;

create table members (
start_date string,
start_station_code string,
end_date string,
end_station_code string,
duration_sec int,
is_member tinyint)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;

create table notmembers (
start_date string,
start_station_code string,
end_date string,
end_station_code string,
duration_sec int,
is_member tinyint)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;

insert into members
	select start_date string,
	start_station_code string,
	end_date string,
	end_station_code string,
	duration_sec int,
	is_member tinyint from data where is_member=1;

insert into notmembers
	select start_date string,
	start_station_code string,
	end_date string,
	end_station_code string,
	duration_sec int,
	is_member tinyint from data where is_member=0;
