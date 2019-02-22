# Assignment 2 Notes

### Sqoop

- There is an issue with my instance of cloudera having too much latency and causing timeouts with the connection to HBase. As a result P1Q3 was not successfully run as the table could not be created in HBase.

### Flume

- For the Flume portion of this assignment the agent was tested by opening a telnet shell (typing "telnet localhost 45454" into the terminal) and typing the words "USD", "EUR", and "GARBAGE" into the shell
- If the USD text went to the USD hdfs directory, EUR went to the EUR hdfs directory, and GARBAGE went to the GNL directory the agent is working as intended