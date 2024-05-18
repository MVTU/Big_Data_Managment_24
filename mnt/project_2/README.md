# Analysing New York City Taxi Data with Spark

**Please upload the files in one ZIP on Moodle by X**

## Dataset

Same as project 1.

## Development environment

For this project, you should reuse the same environment you used for the practice related to Spark and Spark Structured Streaming. Use the notebooks you find on Moodle, in particular

* The notebook `Kafka_Producer_for_Project` reads the file and ingests the data into Kafka with the schema needed.
    * Consider that for the timestamp, it uses the current one.
    * Put the csv with the data in the same folder.
* The notebook `Project_Template` registers Spark to the stream and puts it in a
manageable form. Be careful not to edit the cell already there unless you know what you are doing ;).

## What do we need to compute?

Imagine you want to create a dashboard that shows real-time statistics about what’s at the taxi drivers

1. **[Query 1]** Utilization over a window of 5, 10, and 15 minutes per taxi/driver. This can be computed by computing the idle time per taxi. How does it change? Is there an optimal window?

2. **[Query 2]** The average time it takes for a taxi to find its next fare(trip) per destination borough. This can be computed by finding the time difference, e.g. in seconds, between the trip's drop off and the next trip's pick up within a given unit of time

3. **[Query 3]** The number of trips that started and ended within the same borough in the last hour

4. **[Query 4]** The number of trips that started in one borough and ended in another one in the last
hour

