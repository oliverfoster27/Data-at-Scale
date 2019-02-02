A = LOAD '/home/cloudera/Desktop/a1/Protocol Data/protocols.txt' USING PigStorage('\n') AS line:chararray;
B = FOREACH A GENERATE REGEX_EXTRACT($0,'^(?m)([^#]+?)(?:\t+?#)',1) as (urlString:chararray);
C = FILTER B BY NOT ($0 == '');
D = FILTER C BY NOT ($0 == 'ip\t0\tIP');
E = FOREACH D GENERATE STRSPLIT($0, '\t', 3);
STORE E INTO '/home/cloudera/Desktop/a1/P2Q1_output' using PigStorage(',');
