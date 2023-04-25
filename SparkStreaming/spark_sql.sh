#mvn package
docker cp stream/dataset.csv spark:/opt/bitnami/spark/dataset.csv
docker cp final-project-1.0-SNAPSHOT.jar spark:/opt/bitnami/spark/app_sql.jar
winpty -Xallow-non-tty  docker exec -it spark spark-submit --master=local --conf spark.sql.shuffle.partitions=1 --class com.cs523.SparkSQLAnalyze --packages "org.apache.hbase:hbase-client:2.4.17,org.apache.hbase:hbase-common:2.4.17" app_sql.jar dataset.csv