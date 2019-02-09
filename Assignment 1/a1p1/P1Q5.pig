stationsRaw = LOAD '/home/cloudera/Desktop/a1/Bixi Data/Stations_2017.csv' USING PigStorage(',')
AS (code:chararray, name:chararray, latitude:double, longitude:double);
stations = FILTER stationsRaw BY NOT (code == 'code');

station_detail = FILTER stations BY (code == '6706');

DUMP station_detail;
