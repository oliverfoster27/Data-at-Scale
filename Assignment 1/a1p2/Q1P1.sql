use a1p2;

create table stations (
code string,
name string,
latitude double,
longitude double)
Row format delimited fields terminated by ',' stored as TextFile
TBLPROPERTIES ("skip.header.line.count"="1");load data inpath '/a1p2/BixiMontrealRentals2018/Stations_2018.csv' into table stations;

create table data (
start_date string,
start_station_code string,
end_date string,
end_station_code string,
duration_sec int,
is_member tinyint)
Row format delimited fields terminated by ',' stored as TextFile location '/a1p2/BixiMontrealRentals2018/Rides'
TBLPROPERTIES ("skip.header.line.count"="1");
