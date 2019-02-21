# Flume Workshop Notes

agent1.conf is the config file for the flume connection between localhost port 41415 and a logger
This connection was tested using the tool telnet with the command "telnet localhost 41415"
The agent was started with the command "flume-ng agent -n agent1 -f agent1.conf -c conf"

agent1-hdfs.conf is the same as the first agent except its sink is hdfs instead of a logger