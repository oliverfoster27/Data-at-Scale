use a1p2;

select count(*) from data_part tablesample (bucket 4 out of 8);
