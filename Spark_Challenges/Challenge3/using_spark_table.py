from pyspark.sql import SparkSession
from pyspark import SparkContext as sc

spark = SparkSession.builder.appName('test').getOrCreate()

spark.sql("create database if not exists db")
spark.sql("create table db.guests (booking_id INT,guest_name STRING, checkin_date DATE, checkout_date DATE, room_type STRING, total_price DOUBLE) using csv location '/root/spark/guests.csv'")

spark.sql("select * from db.guests;").show()


count_before_caching = spark.sql("SELECT COUNT(*) FROM db.guests").show()


avg_price_without_caching = spark.sql("SELECT room_type, AVG(total_price) FROM db.guests GROUP BY room_type limit 3").show()