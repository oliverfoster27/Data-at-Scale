use twitter;
ADD JAR /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core-1.1.0-cdh5.13.0.jar;
ADD JAR /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar;

List jars;

drop table tweets;
CREATE EXTERNAL TABLE twitter.tweets (
  id string,
  created_at string,
  text string,
  source string,
  
  user STRUCT<
    id_str: string,
    name: string,
    screen_name: string,
    location: string,
    description: string,
    followers_count: bigint,
    statuses_count: INT,
    friends_count: bigint,
    verified: BOOLEAN,
    utc_offset: INT,
    time_zone: string,
    geo_enabled: BOOLEAN >,
  
  favorited BOOLEAN,
  lang string,
  in_reply_to_status_id string,
  in_reply_to_user_id string,
  in_reply_to_screen_name string,
  geo  string,
  coordinates string,
  place string,
  contributors string,
  
  retweeted_status STRUCT<
    text: string,
    retweet_count: INT,
    user:STRUCT<screen_name: string, name: string>,
    in_reply_to_status_id: string,
    in_reply_to_user_id: string,
    in_reply_to_screen_name: string >,
  
  entities STRUCT< 
    hashtags: ARRAY<STRUCT<text: string >>,
    urls: ARRAY< STRUCT<url: string >>,
    user_mentions: ARRAY< STRUCT<screen_name: string, name: string, id_str: string >>>,
  
  timestamp_ms  string
)
PARTITIONED BY (year INT, month INT, day INT, hour INT)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION '/tweets';

MSCK REPAIR TABLE twitter.tweets;
SHOW PARTITIONS twitter.tweets;
select * from twitter.tweets limit 10;