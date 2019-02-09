use a1p2;

select a.* from members a left semi join 
(select cast(max(duration_sec) as float) as max_duration from members) b on (a.duration_sec = b.max_duration)
limit 1;

select a.* from notmembers a left semi join 
(select cast(max(duration_sec) as float) as max_duration from notmembers) b on (a.duration_sec = b.max_duration)
limit 1;
