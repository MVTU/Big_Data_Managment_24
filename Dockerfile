FROM quay.io/jupyter/pyspark-notebook:latest

# Delta lake

RUN mamba install --yes 'delta-spark' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER root

RUN echo 'spark.sql.extensions io.delta.sql.DeltaSparkSessionExtension' >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
    echo 'spark.sql.catalog.spark_catalog org.apache.spark.sql.delta.catalog.DeltaCatalog' >> "${SPARK_HOME}/conf/spark-defaults.conf"

USER ${NB_UID}

RUN echo "from pyspark.sql import SparkSession" > /tmp/init-delta.py && \
    echo "from delta import *" >> /tmp/init-delta.py && \
    echo "spark = configure_spark_with_delta_pip(SparkSession.builder).getOrCreate()" >> /tmp/init-delta.py && \
    python /tmp/init-delta.py && \
    rm /tmp/init-delta.py

# Kafka

USER root

RUN wget -P /usr/local/spark/jars/ https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.5.0/spark-sql-kafka-0-10_2.12-3.5.0.jar && \
    chmod 644 /usr/local/spark/jars/spark-sql-kafka-0-10_2.12-3.5.0.jar && \
    wget -P /usr/local/spark/jars/ https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.4.0/kafka-clients-3.4.0.jar && \
    chmod 644 /usr/local/spark/jars/kafka-clients-3.4.0.jar && \
    wget -P /usr/local/spark/jars/ https://repo1.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-10-assembly_2.12/3.5.0/spark-streaming-kafka-0-10-assembly_2.12-3.5.0.jar && \
    chmod 644 /usr/local/spark/jars/spark-streaming-kafka-0-10-assembly_2.12-3.5.0.jar && \
    wget -P /usr/local/spark/jars/ https://repo1.maven.org/maven2/org/apache/commons/commons-pool2/2.12.0/commons-pool2-2.12.0.jar && \
    chmod 644 /usr/local/spark/jars/commons-pool2-2.12.0.jar && \
    rm /usr/local/spark/jars/commons-pool-1.5.4.jar && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir python-dotenv>=1.0.1

USER ${NB_UID}